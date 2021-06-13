import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/summary_cubit.dart';
import 'package:serva_cash_register/logic/text_field_error_cubit.dart';

class ConfirmCloseService extends StatelessWidget {
  final TextEditingController labelController = TextEditingController();
  final String text;
  bool isPasswordFalse;
  ConfirmCloseService(this.text, {this.isPasswordFalse});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              Icons.vpn_key,
              size: 40,
              color: Colors.green,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Confirmation de cloture',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      content: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 55),
        width: 650,
        height: 290,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: TextField(
                obscureText: true,
                controller: labelController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: 'Mot de passe'.toUpperCase(),
                  border: InputBorder.none,
                ),
              ),
            ),
            BlocBuilder<TextFieldErrorCubit, TextFieldErrorState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Veuillez entrer votre mot de passe',
                    style: TextStyle(
                        color: (state.hasError) ? Colors.red : Colors.white),
                  ),
                );
              },
            ),
            (isPasswordFalse != null && isPasswordFalse)
                ? Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mot de passe incorrect',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Colors.blue.shade100,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      BlocProvider.of<TextFieldErrorCubit>(context).noError();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    child: Text(
                      'Cloturer',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      backgroundColor: Colors.green.shade100,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      if (labelController.text.isEmpty) {
                        BlocProvider.of<TextFieldErrorCubit>(context).error();
                      } else {
                        Navigator.pop(context);
                        BlocProvider.of<TextFieldErrorCubit>(context).noError();
                        BlocProvider.of<SummaryCubit>(context)
                            .endService(labelController.text);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

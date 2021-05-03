import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serva_cash_register/logic/settings_cubit.dart';

class TeamButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: (state is SettingsTeam) ? Color(0xffF8F9F9) : Colors.white,
            border: Border(
              left: BorderSide(
                  width: 3,
                  color: (state is SettingsTeam)
                      ? Color(0xff0083FB)
                      : Colors.white),
            ),
          ),
          child: TextButton(
            onPressed: () {
              BlocProvider.of<SettingsCubit>(context).settingsTeamSelected();
            },
            child: Text(
              'Mon Equipe',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}

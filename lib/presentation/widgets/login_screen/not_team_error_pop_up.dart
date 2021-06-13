import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotTeamErrorPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              Icons.info,
              size: 40,
              color: Colors.red,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Oups !!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      content: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 55),
        width: 550,
        height: 150,
        child: Column(
          children: [
            Text(
                'Votre compte n\'est pas ajouté à l\'équipe travaillant avec cette tablette. Merci de contacter votre responsable pour régler ce problème. MERCI!'),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'Bien compris',
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
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenEmptySaleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Enregistrer une vente',
              style: TextStyle(fontSize: 25, fontFamily: 'SourceSansPro'),
            ),
            SizedBox(height: 5),
            Text(
              'Ajouter des articles à votre vente actuelle',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 25),
            ),
            SizedBox(height: 5),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Afficher les ventes en attentes',
                  style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                print('Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}

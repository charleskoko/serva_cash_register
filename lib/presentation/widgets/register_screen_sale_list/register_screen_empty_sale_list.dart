import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreenEmptySaleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.6),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Enregistrer une vente',
            style: TextStyle(fontSize: 30, fontFamily: 'SourceSansPro'),
          ),
          SizedBox(height: 10),
          Text(
            'Ajouter des articles à votre vente actuelle',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 20),
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text(
              'Afficher les ventes en attentes',
              style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
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
    );
  }
}

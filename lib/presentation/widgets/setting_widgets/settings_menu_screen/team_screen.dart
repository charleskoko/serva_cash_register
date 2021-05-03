import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Pas d\' enregistrement',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 30,
                          color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                child: TextButton(
                  child: Container(
                      padding: EdgeInsets.all(10), child: Text('Ajouter')),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

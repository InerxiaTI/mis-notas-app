import 'package:flutter/material.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        color: Colors.red,
        height: 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  shadowColor: Colors.black,
                  elevation: 3,
                  child: ListTile(
                    title: Text('Total Creditos: 12'),
                  )),
              Card(
                shadowColor: Colors.black,
                elevation: 3,
                child: ListTile(title: Text('Definitiva semestre: 3,7')),
              )
            ]));
  }
}

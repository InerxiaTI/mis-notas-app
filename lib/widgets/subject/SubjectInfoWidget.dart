import 'package:flutter/material.dart';

class SubjectInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_subjectInfo()],
    );
  }

  Widget _subjectInfo() {
    return Container(
        width: double.infinity,
        color: Colors.blue,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sistemas Operativos'),
            Text('Profesor: Juan Guillermo Hernandez Alarcon'),
            Text('Estado: Ganada'),
          ],
        ));

  }
}

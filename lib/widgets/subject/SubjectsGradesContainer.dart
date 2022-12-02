import 'package:flutter/material.dart';
import 'package:mis_notas/widgets/subject/SubjectsGradesListWidget.dart';

import 'SubjectInfoWidget.dart';

class SubjectsGradesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
            color: Colors.amber,
            child: Column(
              children: [SubjectInfoWidget(), SubjectsGradesListWidget()],
            ))
      ],
    ));
  }
}

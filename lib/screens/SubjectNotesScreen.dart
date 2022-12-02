import 'package:flutter/material.dart';
import 'package:mis_notas/widgets/subject/SubjectsGradesContainer.dart';

class SubjectNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String subject =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-subject';

    return Scaffold(appBar: AppBar(), body: SubjectsGradesContainer());
  }
}

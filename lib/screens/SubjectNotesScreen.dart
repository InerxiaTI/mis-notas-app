import 'package:flutter/material.dart';
import 'package:mis_notas/models/Subject.dart';
import 'package:mis_notas/widgets/subject/SubjectsGradesContainer.dart';

import '../models/SemesterWithSubjectsGradeDto.dart';
import '../models/SubjectNotesInfoDto.dart';

class SubjectNotesScreen extends StatelessWidget {
  final SemesterWithSubjectsGradeDto? semesterWithSubjectsGradeDto;

  const SubjectNotesScreen({super.key, this.semesterWithSubjectsGradeDto});


  @override
  Widget build(BuildContext context) {
    final SubjectNotesInfoDto subjectNotesInfoDto = ModalRoute.of(context)?.settings.arguments as SubjectNotesInfoDto;
    //TODO dada la info de una materia, obtener los datos de esa materia. VALIDAR ENDPOINTS
    print('subject screnn: ${subjectNotesInfoDto?.subject?.subjectId}');

    return Scaffold(appBar: AppBar(), body: SubjectsGradesContainer());
  }
}

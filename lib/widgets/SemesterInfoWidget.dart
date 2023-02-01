import 'package:flutter/material.dart';
import 'package:mis_notas/models/SubjectNotesInfoDto.dart';

import '../models/SemesterInfoResponse.dart';
import '../models/SemesterWithSubjectsGradeDto.dart';
import '../models/Subject.dart';

class SemesterInfoWidget extends StatelessWidget {

  final SemesterInfoResponse? semesterInfoResponse;

  const SemesterInfoWidget({super.key, required this.semesterInfoResponse});



  @override
  Widget build(BuildContext context) {


    return Column(children: [
      _semesterInfo(),
      Card(
        child: Container(
            height: 40,
            child: ListTile(
              onTap: null,
              title: Row(children: <Widget>[
                Expanded(child: Text("Materia")),
                Expanded(child: Text("Creditos")),
                Expanded(child: Text("Nota")),
              ]),
            )),
      ),
      Expanded(
        child: _semesterSubjectList(),
      )
    ]);
  }

  Widget _semesterInfo() {
    final semesterInfo = this.semesterInfoResponse?.body;
    final semesterLevel = (semesterInfo?.semesterLevel)==null?0:semesterInfo?.semesterLevel;
    final semesterName = (semesterInfo?.semesterName)==null?'XZ':semesterInfo?.semesterName;

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Semestre: ${semesterName!.toString()}'),
            Text('Nivel: ${semesterLevel!.toString()}'),
            Text('Cantidad de materias: ${semesterInfo?.numberSubjects}'),
            Text('Fecha inicio: ${semesterInfo?.startDate}'),
            Text('Fecha fin: ${semesterInfo?.endDate}')
          ],
        ));
  }

  Widget _semesterSubjectList() {

    final List<Subject>? subjects = this.semesterInfoResponse?.body?.subjects;
    final listSize = (subjects?.length)==null?1:subjects?.length;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listSize,
      itemBuilder: (_, int index) {
        final subject = subjects?[index];
        return _Subject(subject: subject, semesterWithSubjectsGradeDto: semesterInfoResponse?.body,);
      },
    );
  }
}

class _Subject extends StatelessWidget {

  final Subject? subject;
  final SemesterWithSubjectsGradeDto? semesterWithSubjectsGradeDto;

  const _Subject({super.key, this.subject, required this.semesterWithSubjectsGradeDto});


  @override
  Widget build(BuildContext context) {

    final subjectName = (subject?.subjectName)==null?'NONE':subject!.subjectName;
    final subjectCredits = (subject?.credits)==null?0:subject!.credits;
    final subjectGrade = (subject?.grade)==null?0.0:subject!.grade;

    final subjectNotesInfoDto = new SubjectNotesInfoDto(
        subject: subject,
        semesterId: semesterWithSubjectsGradeDto?.semesterId,
        studentId:  semesterWithSubjectsGradeDto?.studentId
    );

    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'subject-notes',
            arguments: subjectNotesInfoDto),
        child: Container(
            child: ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                        subjectName,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xFF212121),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Expanded(
                    child: Text(
                      subjectCredits.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subjectGrade.toString(),
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

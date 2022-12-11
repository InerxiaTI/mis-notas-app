import 'package:flutter/material.dart';
import 'package:mis_notas/models/SemesterWithSubjectsGradeDto.dart';
import 'package:mis_notas/providers/SemesterInfoProvider.dart';
import 'package:mis_notas/widgets/SemesterSubjectListWidget.dart';
import 'package:provider/provider.dart';

import '../models/SemesterInfoResponse.dart';
import '../models/Subject.dart';

class SemesterInfoWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "Materia": "Calidad",
      "Estado": "Cursando",
      "Creditos": "4",
      "Nota": "3.0"
    },
    {"Materia": "SO", "Estado": "Cursando", "Creditos": "4", "Nota": "3.0"},
    {
      "Materia": "MECANICA",
      "Estado": "Cursando",
      "Creditos": "4",
      "Nota": "3.0"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final semesterInfoProvider = Provider.of<SemesterInfoProvider>(context);
    semesterInfoProvider.getOnDisplay();

    print("ON WIDGET");
    print(semesterInfoProvider.semesterInfoResponseProvider?.body?.subjects[0].subjectPensumId.toString());

    return Column(children: [
      _semesterInfo(semesterInfoProvider.semesterInfoResponseProvider),
      Card(
        child: Container(
            height: 40,
            color: Colors.red,
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
        child: _semesterSubjectList(semesterInfoProvider.semesterInfoResponseProvider),
      )
    ]);
  }

  Widget _semesterInfo(SemesterInfoResponse? semesterInfoResponse) {
    final semesterInfo = semesterInfoResponse?.body;
    final semestre = semesterInfo?.semesterLevel;

    return Container(
        width: double.infinity,
        color: Colors.blue,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(String.fromCharCode(semestre!)),
            Text(semestre!.toString()),
            Text('Cantidad de materias: ${semesterInfo?.numberSubjects}'),
            Text('Fecha inicio: ${semesterInfo?.startDate}'),
            Text('Fecha fin: ${semesterInfo?.endDate}')
          ],
        ));
  }

  Widget _semesterSubjectList(SemesterInfoResponse? semesterInfoResponse) {
    /*return ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        children: []);*/

    final List<Subject>? subjects = semesterInfoResponse?.body?.subjects;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: subjects?.length,
      itemBuilder: (_, int index) {
        final subject = subjects?[index];
        return _Subject(subject: subject,);
      },
    );
  }
}

class _Subject extends StatelessWidget {

 final Subject? subject;

  const _Subject({super.key, this.subject});


  @override
  Widget build(BuildContext context) {


    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'subject-notes',
            arguments: 'subject-notes'),
        child: Container(
            child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                subject!.subjectName,
                overflow: TextOverflow.clip,
                style: new TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              )),
              Expanded(
                child: Text(
                  subject!.credits.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  subject!.grade.toString(),
                  overflow: TextOverflow.clip,
                  style: new TextStyle(
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

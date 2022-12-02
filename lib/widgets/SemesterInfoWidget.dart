import 'package:flutter/material.dart';
import 'package:mis_notas/widgets/SemesterSubjectListWidget.dart';

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
    return Column(children: [
      _semesterInfo(),
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
        child: _semesterSubjectList(),
      )
    ]);
  }

  Widget _semesterInfo() {
    return Container(
        width: double.infinity,
        color: Colors.blue,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Semestre X'),
            Text('Nivel 5'),
            Text('Cantidad de materias: 3'),
            Text('Fecha inicio: 2022-01-01'),
            Text('Fecha fin: 2022-01-01')
          ],
        ));
  }

  Widget _semesterSubjectList() {
    /*return ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        children: []);*/

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (_, int index) => _Subject(),
    );
  }
}

class _Subject extends StatelessWidget {
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
                'Fisica mecanica',
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
                  '4',
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
                  '3.4',
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

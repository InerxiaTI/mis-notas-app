import 'package:flutter/material.dart';

class SubjectsGradesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Container(
                height: 40,
                color: Colors.red,
                child: ListTile(
                  onTap: null,
                  title: Row(children: <Widget>[
                    Expanded(child: Text("Nombre")),
                    Expanded(child: Text("%")),
                    Expanded(child: Text("Nota")),
                  ]),
                ))),
        _subjectGradestList(),
        _footerSubjectGrades()
      ],
    );
  }

  Widget _subjectGradestList() {
    /*return ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        children: []);*/

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (_, int index) => _Grades(),
    );
  }

  Widget _footerSubjectGrades() {
    return Container(height: 150, color: Colors.red);
  }
}

class _Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    ));
  }
}

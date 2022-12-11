import 'package:flutter/material.dart';

import '../models/SemesterInfoResponse.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  final SemesterInfoResponse? semesterInfoResponse;
  const CustomBottomNavigationWidget({super.key, this.semesterInfoResponse});


  @override
  Widget build(BuildContext context) {

    final totalCredits = (semesterInfoResponse?.body?.totalCredits)!=0?semesterInfoResponse?.body?.totalCredits:0;
    return Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  shadowColor: Colors.black,
                  elevation: 3,
                  child: ListTile(
                    title: Text('Total Creditos: ${totalCredits}'),
                  )),
              Card(
                shadowColor: Colors.black,
                elevation: 3,
                child: ListTile(title: Text('Definitiva semestre: ${semesterInfoResponse?.body?.finalGrade}')),
              )
            ]));
  }
}

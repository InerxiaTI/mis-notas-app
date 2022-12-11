import 'package:flutter/material.dart';
import 'package:mis_notas/widgets/CustomBottomNavigationWidget.dart';
import 'package:provider/provider.dart';

import '../providers/SemesterInfoProvider.dart';
import '../widgets/SemesterInfoWidget.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final semesterInfoProvider = Provider.of<SemesterInfoProvider>(context);
    semesterInfoProvider.getOnDisplay();
    final semesterInfoResponse = semesterInfoProvider.semesterInfoResponseProvider;

    print("ON WIDGET");
    print(semesterInfoProvider.semesterInfoResponseProvider?.body?.subjects[0].subjectPensumId.toString());


    return Scaffold(
      appBar: AppBar(
        title: Text('Notas Udea'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: SemesterInfoWidget(semesterInfoResponse: semesterInfoResponse,),
      bottomNavigationBar: CustomBottomNavigationWidget(semesterInfoResponse: semesterInfoResponse,),
    );
  }
}

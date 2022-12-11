import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mis_notas/models/SemesterInfoResponse.dart';

class SemesterInfoProvider extends ChangeNotifier{

  SemesterInfoResponse? semesterInfoResponseProvider;

  SemesterInfoProvider(){
    print("Provider");
    getOnDisplay();
  }

  Future getOnDisplay() async {
    print('Hola');
    var url = Uri.http('192.168.1.171:8081','/api/subject/get-semester-subjects/4');
    print('url $url');
    final response = await http.get(url);
    final semesterInfoResponse = SemesterInfoResponse.fromJson(response.body);

    print(semesterInfoResponse.body?.subjects[0].subjectPensumId);
    this.semesterInfoResponseProvider = semesterInfoResponse;
    print("HOLA MUNDOA");
  }



}
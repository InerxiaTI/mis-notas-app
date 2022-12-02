import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SemesterInfoProvider extends ChangeNotifier{

  SemesterInfoProvider(){
    print('Semester');
    this.getOnDisplay();
  }

  getOnDisplay() async {
    print('Hola');
    var url = Uri.http('10.0.2.2:8081','/api/subject/get-semester-subjects/4');
    print('url '+url.toString());
    final response = await http.get(url);

    print(response.headers);
  }



}
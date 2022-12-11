
import 'dart:convert';
import 'SemesterWithSubjectsGradeDto.dart';

class SemesterInfoResponse {

  SemesterInfoResponse({
     this.description,
     this.message,
     this.body,
  });

  dynamic? description;
  dynamic? message;
  SemesterWithSubjectsGradeDto? body;

  factory SemesterInfoResponse.fromJson(String str) => SemesterInfoResponse.fromMap(json.decode(str));

  factory SemesterInfoResponse.fromMap(Map<String, dynamic> json) => SemesterInfoResponse(
    description: json["description"],
    message: json["message"],
    body: SemesterWithSubjectsGradeDto.fromMap(json["body"]),
  );

  Map<String, dynamic> toMap() => {
    "description": description,
    "message": message,
    "body": body?.toMap(),
  };
}




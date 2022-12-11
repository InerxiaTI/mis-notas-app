import 'dart:convert';

import 'Subject.dart';

class SemesterWithSubjectsGradeDto {
  SemesterWithSubjectsGradeDto({
    required this.semesterId,
    required this.studentId,
    required this.studentName,
    required this.semesterLevel,
    required this.numberSubjects,
    this.startDate,
    this.endDate,
    required this.subjects,
  });

  int semesterId;
  int studentId;
  String studentName;
  int semesterLevel;
  int numberSubjects;
  dynamic startDate;
  dynamic endDate;
  List<Subject> subjects;

  factory SemesterWithSubjectsGradeDto.fromJson(String str) => SemesterWithSubjectsGradeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SemesterWithSubjectsGradeDto.fromMap(Map<String, dynamic> json) => SemesterWithSubjectsGradeDto(
    semesterId: json["semesterId"],
    studentId: json["studentId"],
    studentName: json["studentName"],
    semesterLevel: json["semesterLevel"],
    numberSubjects: json["numberSubjects"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "semesterId": semesterId,
    "studentId": studentId,
    "studentName": studentName,
    "semesterLevel": semesterLevel,
    "numberSubjects": numberSubjects,
    "startDate": startDate,
    "endDate": endDate,
    "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
  };
}
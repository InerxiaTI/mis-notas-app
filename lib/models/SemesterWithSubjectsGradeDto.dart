import 'dart:convert';

import 'Subject.dart';

class SemesterWithSubjectsGradeDto {
  SemesterWithSubjectsGradeDto({
    required this.semesterId,
    required this.studentId,
    required this.studentName,
    required this.semesterLevel,
    required this.semesterName,
    required this.numberSubjects,
    this.startDate,
    this.endDate,
    required this.finalGrade,
    required this.totalCredits,
    required this.subjects,
  });

  int semesterId;
  int studentId;
  String studentName;
  int semesterLevel;
  String semesterName;
  int numberSubjects;
  dynamic startDate;
  dynamic endDate;
  double finalGrade;
  int totalCredits;
  List<Subject> subjects;

  factory SemesterWithSubjectsGradeDto.fromJson(String str) => SemesterWithSubjectsGradeDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SemesterWithSubjectsGradeDto.fromMap(Map<String, dynamic> json) => SemesterWithSubjectsGradeDto(
    semesterId: json["semesterId"],
    studentId: json["studentId"],
    studentName: json["studentName"],
    semesterLevel: json["semesterLevel"],
    semesterName: json["semesterName"],
    numberSubjects: json["numberSubjects"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    finalGrade: json["finalGrade"],
    totalCredits: json["totalCredits"],
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "semesterId": semesterId,
    "studentId": studentId,
    "studentName": studentName,
    "semesterLevel": semesterLevel,
    "semesterName": semesterName,
    "numberSubjects": numberSubjects,
    "startDate": startDate,
    "endDate": endDate,
    "finalGrade": finalGrade,
    "totalCredits": totalCredits,
    "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
  };
}

//SubjectGradeDto
import 'dart:convert';

class Subject {
  Subject({
    required this.subjectId,
    required this.subjectPensumId,
    required this.subjectName,
    required this.credits,
    this.teacher,
    required this.status,
    required this.grade,
  });

  int subjectId;
  int subjectPensumId;
  String subjectName;
  int credits = 0;
  dynamic teacher;
  String status;
  double grade;

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
    subjectId: json["subjectId"],
    subjectPensumId: json["subjectPensumId"],
    subjectName: json["subjectName"],
    credits: json["credits"],
    teacher: json["teacher"],
    status: json["status"],
    grade: json["grade"],
  );

  Map<String, dynamic> toMap() => {
    "subjectId": subjectId,
    "subjectPensumId": subjectPensumId,
    "subjectName": subjectName,
    "credits": credits,
    "teacher": teacher,
    "status": status,
    "grade": grade,
  };
}

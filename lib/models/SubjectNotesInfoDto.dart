
import 'package:mis_notas/models/Subject.dart';

class SubjectNotesInfoDto{

  SubjectNotesInfoDto({
    this.subject,
    required this.semesterId,
    required this.studentId
  });

  Subject? subject;
  int? semesterId;
  int? studentId;

}
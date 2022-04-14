import 'package:samedu/src/model/teacher_model.dart';

class ScheduleModel {
  String subject;
  String weekDay;
  String start;
  String end;
  String room;
  TeacherModel teacher;

  ScheduleModel({
    required this.subject,
    required this.weekDay,
    required this.start,
    required this.end,
    required this.room,
    required this.teacher,
  });
}

import 'package:hive_flutter/adapters.dart';
part 'student_list_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String Studentname;

  StudentModel(this.id, this.Studentname);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/db/models/student_list_model.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel student) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.add(student);

  studentListNotifier.value.add(student);
  studentListNotifier.notifyListeners();
}

Future<void> getStudentData() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
}

Future<void> dleteStudent(id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.delete(id);
  getStudentData();
}

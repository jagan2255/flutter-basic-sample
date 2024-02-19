import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/functions/student_list_function.dart';
import 'package:flutter_application_1/db/models/student_list_model.dart';

void main() {
  runApp(MaterialApp(
    home: MySecondWidget(),
  ));
}

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({Key? key}) : super(key: key);

  @override
  State<MySecondWidget> createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {
  final _textdata = TextEditingController();
  String numberword = "Display Text";

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    getStudentData();

    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(child: Text("hello")),
              TextField(
                controller: _textdata,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter your text here',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    numberword = _textdata.text;
                    DateTime now = DateTime.now();
                    int timestamp = now.millisecondsSinceEpoch;
                    final studentName = StudentModel(timestamp, numberword);
                    addStudent(studentName);
                    _textdata.text = "";
                  });
                },
                child: Text("Click"),
              ),
              Text(numberword),
              Expanded(
                child: ValueListenableBuilder<List<StudentModel>>(
                  valueListenable:
                      studentListNotifier, // Assuming studentListNotifier is declared elsewhere
                  builder: (
                    BuildContext ctx,
                    List<StudentModel> studentList,
                    Widget? child,
                  ) {
                    return ListView.separated(
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(studentList[index].Studentname),
                          trailing: IconButton(
                            onPressed: () {
                              dleteStudent(studentList[index].id);
                            },
                            icon: const Icon(Icons.delete_forever),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) => Divider(),
                      itemCount: studentList.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

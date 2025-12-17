import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key, required this.lstStudents});

  final List<StudentModel> lstStudents;

  @override
  Widget build(BuildContext context) {
    return lstStudents.isEmpty
        ? Text(
            "No Data",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
          )
        : ListView.builder(
            itemCount: lstStudents.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final studentData = lstStudents[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(studentData.fname[0].toUpperCase()),
                ),
                title: Text('${studentData.fname} ${studentData.lname}'),
                subtitle: Text(studentData.city),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        // students.removeAt(index);

                        // });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.student});

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("first name:${student.fname}", style: TextStyle(fontSize: 24)),
            Text("last name:${student.lname}", style: TextStyle(fontSize: 24)),
            Text("City: ${student.city}", style: TextStyle(fontSize: 24)),
          ],
        ),
        // child: Center(
        //   child: Text(
        //     "hello i am cardview screen",
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),
      ),
    );
  }
}
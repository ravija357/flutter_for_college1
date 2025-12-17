import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';
import 'package:flutter_for_college/widgets/card_widget.dart';


class CardviewScreen extends StatelessWidget {
  const CardviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StudentModel> students = [
      StudentModel(fname: "John", lname: "Doe", city: "New York"),
      StudentModel(fname: "Jane", lname: "Smith", city: "Los Angeles"),
      StudentModel(fname: "Michael", lname: "Johnson", city: "Chicago"),
      StudentModel(fname: "Emily", lname: "Davis", city: "Houston"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("cardview"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return CardWidget(student: student);

          // Widget displayCard(String title){
          //   return GestureDetector(
          //     onTap: () {
          //       motiontoast(description:Text("$title is clicked", show(content))
          //       .show(context))
          //     },
          //     child:SizedBox(
          //       height: 200,
          //       width: double.infinity,
          //     )
          //   )
        },
      ),
    );
  }
}
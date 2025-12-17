import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/employee_model.dart';

class EmployeeOutputScreen extends StatelessWidget {
  final List<EmployeeModel> employees;

  const EmployeeOutputScreen({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Employees'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: employees.isEmpty
          ? const Center(
              child: Text(
                'No employees to display',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final emp = employees[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(emp.fullname[0].toUpperCase()),
                    ),
                    title: Text(emp.fullname, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender: ${emp.gender}'),
                        Text('Department: ${emp.department}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

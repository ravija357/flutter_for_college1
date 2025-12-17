import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/employee_model.dart';
import 'package:flutter_for_college/screens/employee_output_screen.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  String? _selectedGender;
  String? _selectedDepartment;


  final List<EmployeeModel> _employees = [];

  final List<DropdownMenuItem<String>> _gender = [
    const DropdownMenuItem(value: "Male", child: Text("Male")),
    const DropdownMenuItem(value: "Female", child: Text("Female")),
    const DropdownMenuItem(value: "Other", child: Text("Other")),
  ];

  final List<DropdownMenuItem<String>> _department = [
    const DropdownMenuItem(value: "IT", child: Text("IT")),
    const DropdownMenuItem(value: "Selles", child: Text("Selles")),
    const DropdownMenuItem(value: "Support", child: Text("Support")),
  ];

  @override
  void dispose() {
    _fnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _fnameController,
                decoration: InputDecoration(
                  labelText: 'Employee Name',
                  hintText: 'Enter employee name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter employee name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: _gender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: const Icon(Icons.import_contacts),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) => value == null ? 'Please select gender' : null,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: _selectedDepartment,
                items: _department,
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Department',
                  prefixIcon: const Icon(Icons.deblur),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) => value == null ? 'Please select department' : null,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Add Employee"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EmployeeModel newEmp = EmployeeModel(
                            fullname: _fnameController.text,
                            gender: _selectedGender!,
                            department: _selectedDepartment!,
                          );
                          setState(() {
                            _employees.add(newEmp);
                            _fnameController.clear();
                            _selectedGender = null;
                            _selectedDepartment = null;
                            _formKey.currentState!.reset();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.visibility),
                      label: const Text("View Employees"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EmployeeOutputScreen(employees: _employees),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Employees Added: ${_employees.length}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              _employees.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          "No employees added yet.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        itemCount: _employees.length,
                        itemBuilder: (context, index) {
                          final emp = _employees[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(emp.fullname[0].toUpperCase()),
                              ),
                              title: Text(emp.fullname),
                              subtitle: Text("${emp.gender} • ${emp.department}"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _employees.removeAt(index);
                                  });
                                },
                              ),
                            ),
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

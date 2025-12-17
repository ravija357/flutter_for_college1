import 'package:flutter/material.dart';
import 'package:flutter_for_college/widgets/data_table_widget.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Table Screen"),),
      body: SafeArea(child: DataTableWidget()),
      );
  }
}
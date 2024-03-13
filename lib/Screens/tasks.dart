import 'package:flutter/material.dart';
import 'package:trial_todo_app/Utils/data_function.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DataFunction.customMenuDrawer(context),
      body: Center(
        child: Text('Tasks'),
      ),
    );
  }
}
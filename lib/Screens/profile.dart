import 'package:flutter/material.dart';
import 'package:trial_todo_app/Utils/data_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DataFunction.customMenuDrawer(context),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
import 'package:activity/core/types/active_type.dart';
import 'package:flutter/material.dart';
import 'package:trial_todo_app/Screens/dashboard_nav.dart';
import 'package:trial_todo_app/State/controller.dart';

class LoginController extends MainController{
  TextEditingController emailController = TextEditingController(text: 'test@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '12345');

 loginUser(BuildContext context) {
    if (globalKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      ).closed.then((value) => 
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DashBoardScreen())));    
    }   
    
  }

   @override
  List<ActiveType> get activities {
    return [];
  }

}
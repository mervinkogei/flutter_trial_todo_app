import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial_todo_app/widgets/searchBar_widget.dart';

import '../Utils/textStyling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       const SystemUiOverlayStyle(
         statusBarColor: Colors.transparent
         //color set to transperent or set your own color
      )
  );
  
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.notifications_active_outlined, size: 35,),
          SizedBox(width: 7,),
          Padding(
            padding: const EdgeInsets.only(right:15),
            child: Image.asset('images/avatar.png', height: 40, width: 40,),
          ),
        ],
      ),
      drawer: Drawer(),
      body:  Padding(
        padding: EdgeInsets.only(left:20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(' Welcome To\n Task Manager!',style: ThemeStyling.welcomeTitle,),
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(' What are you doing Today!'),
            ),
            // SearchBar(hintText: "Your recent task here..",)
            SearchBarWidget()
          ],
        ),
      )
    );
  }
}
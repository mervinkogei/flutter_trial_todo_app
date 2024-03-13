import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark, 
      //set brightness for icons, like dark background light icons
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(' Welcome To\n Task Manager!',)
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:trial_todo_app/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashView(
         gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.grey, Colors.black54]),
        duration: const Duration(seconds: 4),
        title: const Text('Welcome to TODO App', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        logo: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('images/logo.png'),
        ),
        done: Done(
          const HomeScreen(),
           curve: Curves.linearToEaseOut,
          ),
      ),
    );
  }
}

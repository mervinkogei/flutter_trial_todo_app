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
         gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.green, Colors.blue]),
        // backgroundColor: Colors.red,
        loadingIndicator: RefreshProgressIndicator(),
        duration: const Duration(seconds: 4),
        title: Text('Welcome to TODO App'),
        logo: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlutterLogo(size: 40,),
        ),
        done: Done(
          HomeScreen(),
           curve: Curves.linearToEaseOut,
          ),
      ),
    );
  }
}

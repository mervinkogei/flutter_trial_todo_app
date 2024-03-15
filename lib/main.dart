import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickeydb/quickeydb.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:trial_todo_app/Database/Schema/task_schema.dart';
import 'package:trial_todo_app/Database/Schema/user_schema.dart';
import 'package:trial_todo_app/Screens/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

 WidgetsFlutterBinding.ensureInitialized();

/**
 * Initialize QuickeyDb to be used Locally
 */

  await QuickeyDB.initialize(
    dbName: "QuickeyDB.db",
    persist: true,
    dbVersion: 1,
    dataAccessObjects: [
      UserSchema(),
      TaskSchema(),
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      /**
       * Splash Screen starts Here
       */
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
        /**
         * Once the splash screen is loaded, Home screen is the loaded next
         */
        done: Done(
          const LoginScreen(),
           curve: Curves.linearToEaseOut,
          ),
      ),
      builder: EasyLoading.init(),
    );
  }
}

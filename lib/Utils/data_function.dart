import 'package:flutter/material.dart';
import 'package:trial_todo_app/State/login_controller.dart';
import 'package:trial_todo_app/State/login_view.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';

class DataFunction{

  /*
   Added A Custom Alert Dialof functionality
   */
  static showAlertDialog(BuildContext context) {

  Widget okButton = ElevatedButton(
    child: const Text("Delete", style: ThemeStyling.deleteAlert,),
    onPressed: () =>Navigator.of(context, rootNavigator: true).pop(),
  ); 

  Widget cancelButton = ElevatedButton(
    child: const Text("Yes", style: ThemeStyling.acceptAlert,),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      }
  ); 

  AlertDialog alert = AlertDialog(
    title: const Text("Confirmation Alert!"),
    content: const Text("Do you still want to proceed with the action."),
    actions: [
      okButton,
      cancelButton,
    ],
  );  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

static customMenuDrawer(BuildContext context){
  return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
                UserAccountsDrawerHeader(
        decoration: const BoxDecoration(color: Color(0xff000000)),
        accountName: const Text(
          "Kogei Vincent",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: const Text(
          "vincentkogei@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        currentAccountPicture: Image.asset('images/avatar.png'),
      ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list,
              ),
              title: const Text('Task'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.blue[200]),

             ListTile(
              leading: const Icon(
                Icons.logout_outlined,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginView(activeController: LoginController(),)),
            (route) => false);
              },
            ),
          ],
        ),
      );
       
}

}
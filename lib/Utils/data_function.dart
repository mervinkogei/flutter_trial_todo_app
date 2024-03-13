import 'package:flutter/material.dart';
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
    child: const Text("Cancel", style: ThemeStyling.acceptAlert,),
    onPressed: () =>Navigator.of(context, rootNavigator: true).pop(),
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
}
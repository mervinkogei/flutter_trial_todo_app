import 'package:activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:trial_todo_app/Database/Models/task_model.dart';
import 'package:trial_todo_app/Database/Models/user_model.dart';  
  
class MainController extends ActiveController {  
  // GlobalKey _globalKey = GlobalKey<FormState>();
  GlobalKey< FormState > globalKey = GlobalKey();

    ActiveString appTitle = ActiveString('First Title');

  /// Active int extend the normal int Type with activity helper functions
  ActiveInt appBarSize = ActiveInt(45);
  ActiveInt pageNumber = ActiveInt(1);
  ActiveInt pageSize = ActiveInt(2);

  /// Active bool extend the normal int Type with activity helper functions
  ActiveBool dataLoaded = ActiveBool(false);

  /// ActiveType is a Type any with activity helper functions
  ActiveType appBackgroundColor = ActiveType(Colors.white);

  ActiveList<ActiveModel<Task>> tasks = ActiveList([
    ActiveModel(Task(
        taskName: 'Test Task',
        description: 'Complete this amazing package',
        user: User(name: 'Vincent Kogei', email: 'vincentkogei@gmail.com'), startDate: '2024-03-18', endDate: '2024-04-10'))
  ]);

  Map schema = {};
  
  /// This override is needed  
   @override  
   List<ActiveType> get activities {  
      return [tasks];  
   }  

    ActiveMap<String, Map<String, dynamic>> formResults = ActiveMap({});

    
}
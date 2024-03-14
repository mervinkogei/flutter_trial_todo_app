import 'package:trial_todo_app/Database/Models/user_model.dart';

class Task {
   int? id;
   String taskName;
   String description;
   DateTime? startDate;
   DateTime? endDate;
   User? user;

   Task({
      this.id,
      required this.taskName,
      required this.description,
      required this.startDate,
      required this.endDate,
      this.user,
   });

   Task.fromMap(Map<String?, dynamic> map)
           : id = map['id'],
              taskName = map['taskName'],
              description = map['description'],
              startDate = map['startDate'],
              endDate = map['endDate'],
              user = map['user'] != null ? User.fromMap(map['user']) : null;

   Map<String, dynamic> toMap() => {
      'id': id,
      'taskName': taskName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'user': user != null ? user?.toMap() : null,
   };

   Map<String, dynamic> toTableMap() => {
      'id': id,
      'taskName': taskName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
   };

}
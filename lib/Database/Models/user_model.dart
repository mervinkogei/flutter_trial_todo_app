import 'package:trial_todo_app/Database/Models/task_model.dart';

class User {
   int? id;
   String? name;
   String? email;
   String? password;
   Task? task;

   User({
      this.id,
      required this.name,
      required this.email,
      this.password,
      this.task
   });

   Map<String, dynamic> toMap() => {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'task': task != null ? task!.toMap() : null,
   };

   Map<String, dynamic> toTableMap() => {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
   };

   User.fromMap(Map<String?, dynamic> map)
           : id = map['id'],
              name = map['name'],
              email = map['email'],
              password = map['password'],
              task = map['task'] != null ? Task.fromMap(map['task']) : null;

}

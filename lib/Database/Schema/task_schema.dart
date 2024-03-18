import 'package:quickeydb/quickeydb.dart';
import 'package:trial_todo_app/Database/Models/task_model.dart';
import 'package:trial_todo_app/Database/Schema/user_schema.dart';
// import 'package:trial_todo_app/Database/Schema/user_schema.dart';

class TaskSchema extends DataAccessObject<Task> {
   TaskSchema()
           : super(
        '''
          CREATE TABLE tasks (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER NOT NULL
            taskName TEXT NOT NULL,
            description TEXT,
            startDate TEXT,
            endDate TEXT,
            level INTEGER DEFAULT "1" NOT NULL,
            FOREIGN KEY (user_id) REFERENCES user (id)
          )
          ''',
      relations: [
         const BelongsTo<UserSchema>(),
      ],
      converter: Converter(
         encode: (task) => Task.fromMap(task),
         decode: (task) => task!.toMap(),
         decodeTable: (task) => task!.toTableMap(),
      ),
   );
}
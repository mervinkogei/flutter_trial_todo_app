import 'package:quickeydb/quickeydb.dart';
import 'package:trial_todo_app/Database/Models/user_model.dart';
import 'package:trial_todo_app/Database/Schema/task_schema.dart';

class UserSchema extends DataAccessObject<User> {
   UserSchema()
           : super(
      '''
          CREATE TABLE user (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT
          )
          ''',
      relations: [
         const HasOne<TaskSchema>(),
      ],
      converter: Converter(
         encode: (user) => User.fromMap(user),
         decode: (user) => user!.toMap(),
         decodeTable: (user) => user!.toTableMap(),
      ),
   );

  //  Future<List<User?>> getOldUsers() {
  //     return where({'age >= ?': 18}).toList();
  //  }

   Future<List<User>> doRawQuery() async {
      // Use your custom query
      final results = await database!.rawQuery('SELECT * FROM user');

      // when returning result use converter
      return results.map((result) => converter.encode(result) as User).toList();
   }
}

import 'package:sqflite/sqflite.dart';
import 'package:smart_lifters/databases/dbHelper.dart';
import 'package:smart_lifters/databases/db_base.dart';

class DBTodoTable extends DBBaseTable {
  @override
  var db_table = 'todo';
  static String sql_code = '''
          CREATE TABLE  todo (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              title TEXT, 
              done INTEGER, 
              duedate TEXT,
              create_date TEXT
            )
        ''';
}

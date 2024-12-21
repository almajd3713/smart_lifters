import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  static const _database_name = "bomba.db";
  static const _database_version = 4;
  static var database;

  static List<String> sql_codes = [
    DBTodoTable.sql_code
  ];
  static Future<Database> getDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    if (database != null) {
      return database;
    }

    database = openDatabase(
      join(await getDatabasesPath(), _database_name),
      onCreate: (database, version) {
        for (var item in sql_codes) {
          database.execute(item);
        }
      },
      version: _database_version,
      onUpgrade: (db, oldVersion, newVersion) {
        //do nothing...
      },
    );
    return database;
  }
}

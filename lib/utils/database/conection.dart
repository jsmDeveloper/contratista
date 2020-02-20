import 'package:contratista/utils/database/database.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnect {
  Database _database;

  static final DatabaseConnect _instance = DatabaseConnect._internal();

  factory DatabaseConnect() => _instance;

  DatabaseConnect._internal();

  Future<Database> get db async {
    if (_database != null) return _database;

    _database = await open();

    return _database;
  }

  Future<Database> open() async {
    try {
      String databasesPath = await getDatabasesPath();
      String path = "$databasesPath/contratista.db";
      Database db = await openDatabase(path, version: 1,
          onCreate: (Database database, int version) {
        TableInitial().createTable(database);
      });
      return db;
    } catch (e) {
      print('Error al conectar: ${e.toString()}');
    }
  }
}

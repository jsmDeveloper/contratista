import 'package:contratista/utils/database/conection.dart';
import 'package:contratista/utils/database/database.dart';
import 'package:sqflite/sqflite.dart';

class Crud {

  Database _db;
  DatabaseConnect _database;

  Crud() {
     _database = DatabaseConnect();
     getConnection();
  }

  getConnection() async {
    _db = await _database.db;
  }

  Future<List<TableInitial>> getCollection() async {
    List<Map> maps = await _db.query(TableInitial.TABLE_NAME, columns: TableInitial.TABLE_COLUMN);
    return maps.map((f) => TableInitial.fromMap(f)).toList();
  }
}
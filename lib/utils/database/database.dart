import 'package:sqflite/sqflite.dart';

abstract class TableElement {
  int id;
  String nameTable;

  TableElement(this.id, this.nameTable);

  void createTable(Database db);
  Map<String, dynamic> toMap();
}

class TableInitial extends TableElement {
  static const String TABLE_NAME = 'collection';
  static const List<String> TABLE_COLUMN = ['id', 'table'];

  String nameTable;

  TableInitial({int id, String nameTable}) : super(id, nameTable);

  factory TableInitial.fromMap(Map<String,dynamic> map){
    return TableInitial(id: map['id'], nameTable: map['nameTable']);
  }

  @override
  void createTable(Database db) async {
    String sql =
        'CREATE TABLE $TABLE_NAME (id integer primary key autoincrement, table varchar(30))';
    await db.rawUpdate(sql);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{'table': this.nameTable};
    if (this.id != null) map['id'] = id;
    return map;
  }
}

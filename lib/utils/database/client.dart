import 'package:contratista/utils/database/database.dart';
import 'package:sqflite/sqflite.dart';

class Clients extends TableElement {
  static const String TABLE_NAME = 'clients';
  String name, nit, address, telephone, email;
  int id;

  Clients({this.name, this.nit, this.address, this.telephone, this.email, id})
      : super(id, TABLE_NAME);

  factory Clients.fromMap(Map<String, dynamic> map){
    return Clients(
      id:  map['id'],
      nit: map['nit'],
      address: map['address'],
      telephone: map['telephone'],
      email: map['email']
    );
  }

  @override
  void createTable(Database db) async {
    String sql =
        'CREATE TABLE $TABLE_NAME(id integer primary key autoincrement, nit varchar(20), name varchar(50), address varchar(100), telephone varchar(20), email varchar(200))';
    await db.rawUpdate(sql);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      'nit': this.nit,
      'name': this.name,
      'address': this.address,
      'telephone': this.telephone,
      'email': this.email
    };
    if (this.id != null) map['id'] = id;

    return map;
  }
}

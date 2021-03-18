

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "cliente.db";
  static final _databaseVersion = 1;

  static DatabaseHelper instance = DatabaseHelper();

  static Database _database;
  Future<Database> get database async{
    if(_database != null)
      return _database;
    _database = await _initDatabase();
    return _database;

  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE cliente(
	          id			    INTEGER PRIMARY KEY,
	          cnpj_cpf	  VARCHAR(14),
	          nome		    VARCHAR(100) NOT NULL,
	          cep			    VARCHAR(8),
	          logradouro	TEXT,
	          numero		   VARCHAR(8),
	          telefone	   VARCHAR(15)
	        );
          ''');
  }


}
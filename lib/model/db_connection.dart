import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _open();
    return _database!;
  }

  Future<Database> _open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'db1.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE produto(
          id INTEGER PRIMARY KEY, 
          ean INTEGER, 
          nome TEXT, 
          descricao TEXT,
          quantidade_estoque REAL,
          valor_venda REAL
        )
      ''');

      await db.execute(
          'INSERT INTO produto (ean, nome, descricao, quantidade_estoque, valor_venda) VALUES (123456, "produto1", "descricao1", 1, 100)');
      await db.execute(
          'INSERT INTO produto (ean, nome, descricao, quantidade_estoque, valor_venda) VALUES (654321, "produto2", "descricao2", 2, 200)');
      await db.execute(
          'INSERT INTO produto (ean, nome, descricao, quantidade_estoque, valor_venda) VALUES (333333, "produto3", "descricao3", 3, 300)');
    });

    _database = database;
    return database;
  }
}

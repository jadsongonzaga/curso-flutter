
import 'package:conversor_app/src/infrastruture/database_helper.dart';
import 'package:conversor_app/src/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ClienteRepository{
  var _database = DatabaseHelper().database;

  Future<int> inserir(Cliente cliente) async {
    Database db = await _database;
    Map<String, dynamic> row = {
      'cnpj_cpf' : cliente.cpfCnpj,
      'nome' : cliente.nome,
      'cep' : cliente.cep,
      'logradouro' : cliente.logradouro,
      'numero' : cliente.numero,
      'telefone' : cliente.telefone
    };
    return await db.insert('cliente', row);
  }

  Future<List<Map<String, dynamic>>> obterTodos() async{
    Database db = await _database;
    return db.query('cliente');
  }

  Future<int> remove(int id) async{
    Database db = await _database;
    return db.delete('cliente', where: 'id = ?', whereArgs: [id]);
  }

}
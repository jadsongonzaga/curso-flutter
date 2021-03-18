
import 'package:conversor_app/src/model/cliente.dart';
import 'package:conversor_app/src/repository/cliente_repository.dart';
import 'package:flutter/material.dart';

class ClienteController with ChangeNotifier{
  TextEditingController nome = TextEditingController();
  TextEditingController cpfCnpj = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController logradouro = TextEditingController();
  TextEditingController telefone = TextEditingController();

  Cliente convert(){
    Cliente cliente = Cliente();
    cliente.nome = nome.text;
    cliente.cpfCnpj = cpfCnpj.text;
    cliente.cep = cep.text;
    cliente.logradouro = logradouro.text;
    cliente.telefone = telefone.text;
    return cliente;
  }

  void salvar(){
    ClienteRepository repository = ClienteRepository();
    repository.inserir(convert());

    repository.obterTodos().asStream().forEach((element) => print(element));
    notifyListeners();

  }

  Future<List<Cliente>> listar() async{
    List<Cliente> clientes = [];
    ClienteRepository repository = ClienteRepository();
    var mapClientes = await  repository.obterTodos();
    mapClientes.forEach((element) {
      clientes.add(mapToClient(element));
    });

    return clientes;
    
  }

  Cliente mapToClient(Map<String, dynamic> mapCliente){
    var cliente = Cliente();
    cliente.nome = mapCliente['nome'];
    cliente.cep = mapCliente['cep'];
    cliente.cpfCnpj = mapCliente['cnpj_cpf'];
    cliente.id = mapCliente['id'];
    cliente.logradouro = mapCliente['logradouro'];
    cliente.numero = mapCliente['numero'];

    return cliente;
  }



}

//enum Estados{start, loading, success, error}
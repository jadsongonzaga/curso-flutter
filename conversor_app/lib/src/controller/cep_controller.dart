import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CepController{

  Future<Endereco> obter(String cep) async {
    var client = http.Client();
    var url = Uri.https('viacep.com.br', '/ws/$cep/json/unicode/');
    Endereco endereco = null;

    var response = await http.get(url);
    if(response.statusCode == 200){
      endereco = Endereco.fromJson(convert.jsonDecode(response.body));
    }

    return endereco;

  }

}

class Endereco{
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String gia;
  String ddd;
  String siafi;

  Endereco(this.cep, this.logradouro, this.complemento, this.bairro,
      this.localidade, this.uf, this.gia, this.ddd, this.siafi);

  Endereco.fromJson(Map<String, dynamic> json)
  :cep = json['nome'],
  logradouro = json['logradouro'],
  complemento = json['complemento'],
  bairro = json['bairro'],
  localidade = json['localidade'],
  uf = json['uf'],
  gia = json['gia'],
  ddd = json['ddd'],
  siafi = json['siafi'];
}
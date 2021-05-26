import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class ServicoController{
  OrdemServico ordemServico;
  

  ServicoController(){
    List <Produto> produtos = [
      new Produto(
        descricao: 'Cerca elétrica',
        valor: 5980.90,
        quantidade: 1
      ),

      new Produto(
        descricao: 'Fechadura elétrica',
        valor: 2890.00,
        quantidade: 1
      )];

    List <Servico> servicos = [
      new Servico(
        nome: 'Escolta armada',
        valor: 2000.00,
        quantidade: 4.5
      ),

      new Servico(
        nome: 'Escolta com batedores',
        valor: 2000.00,
        quantidade: 1.5
      ),

      new Servico(
        nome: 'Escolta com batedores',
        valor: 2000.00,
        quantidade: 1.5
      )];



    this.ordemServico = new OrdemServico(
      empresa: 'Bile e Jack Segurança privativa LTDA',
      empresaTelefone: '(75) 3246-1972',
      cliente: 'Jadson Gonzaga',
      celular: '(75) 9 8143-2835',
      email: 'jadson.rnv@gmail.com',
      produtos: produtos,
      servicos: servicos

    );
  }

  Future<String> gerar() async {
    final pdf = pw.Document();
/*
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        })); // Page
*/
    pdf.addPage(pw.MultiPage(
        build: (context) => [
          
              pw.Table.fromTextArray(
                headers: ['Descrição', 'Valor', 'Quantidade'],
                data:  List<List<dynamic>>.generate(
                  ordemServico.produtos.length,
                   (index) => <dynamic>[
                     ordemServico.produtos[index].descricao,
                     ordemServico.produtos[index].valor,
                     ordemServico.produtos[index].quantidade
                   
                   ]
                   
                
                )
              )
            ])); // Page



    final String dir = (await getApplicationDocumentsDirectory()).path;

     //await File('$dir/*.pdf').delete(recursive: true);



    final String path = '$dir/pdfExample.pdf';
    final File file = File(path);
    
    file.writeAsBytesSync(await pdf.save());

    return path;

  }


}

class OrdemServico{

  String empresa;
  String empresaTelefone;
  String cliente;
  String celular;
  String email;
  List <Servico> servicos;
  List <Produto> produtos;

  OrdemServico({this.empresa, this.empresaTelefone, this.cliente, this.celular, this.email, this.servicos, this.produtos});

}

class Servico{
  
  String nome;
  double valor;
  double quantidade;

  Servico({this.nome, this.valor, this.quantidade});
}


class Produto{
  String descricao;
  double valor;
  double quantidade;

  Produto({this.descricao, this.valor, this.quantidade});
}
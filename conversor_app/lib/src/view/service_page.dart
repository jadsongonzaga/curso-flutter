import 'package:conversor_app/src/components/app_drawer.dart';
import 'package:conversor_app/src/controller/servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class ServicePage extends StatelessWidget {
  ServicoController controller = new ServicoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: TextButton(
          child: Text('Gerar'),
          onPressed: (){
            _gerarPdf();

          },
          )),

    );
  }



  _gerarPdf() async {
    String caminho = await controller.gerar();
      
  
    final _result = await OpenFile.open(caminho);
    print(_result.message);

      /*
      ShareExtend.share(
      caminho, "file",
      sharePanelTitle: "Enviar PDF", subject: "example-pdf");
    */
    
                  
  }
}
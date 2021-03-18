
import 'package:conversor_app/main.dart';
import 'package:conversor_app/src/components/app_drawer.dart';
import 'package:conversor_app/src/controller/cliente_controller.dart';
import 'package:conversor_app/src/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


class ListaClientePage extends StatefulWidget {

  @override
  _ListaClientePageState createState() => _ListaClientePageState();
}

class _ListaClientePageState extends State<ListaClientePage> {

  @override
  initState() {
    super.initState();
  }

  
   
  _carregarList(List<Cliente> clientes){
    print("lista");
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index){
        return _myCard(clientes[index]);
      },
    );
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    print('SetState');
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final ClienteController controller = Provider.of(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Cliente>>(
        //_carregarList(),
        future: controller.listar(),
        
        builder: (context, snapshot){
          print(snapshot.data);
          return _carregarList(snapshot.data);
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed(Rotas.cliente);
        },
        ),
    );
  }

  
  Widget _myCard(Cliente cliente){
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _itenCard(cliente)
        ),
      );
  }

  List<Widget> _itenCard(Cliente cliente){
    return <Widget>[

            ListTile(
              leading: Icon(Icons.album),
              title: Text(cliente.nome),
              //${AppLocalizations.of(context).street}
              subtitle: Text('${AppLocalizations.of(context).street}:  ${cliente.logradouro}, ${cliente.numero}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ];

  }
}


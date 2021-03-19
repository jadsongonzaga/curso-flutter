import 'package:conversor_app/main.dart';
import 'package:conversor_app/src/components/app_drawer.dart';
import 'package:conversor_app/src/controller/cliente_controller.dart';
import 'package:conversor_app/src/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaClientePage extends StatefulWidget {
  @override
  _ListaClientePageState createState() => _ListaClientePageState();
}

class _ListaClientePageState extends State<ListaClientePage> {
  ClienteController controller;

  @override
  initState() {
    super.initState();
  }

  _carregarList(List<Cliente> clientes) {
    print("lista");
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
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
    controller = Provider.of(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Cliente>>(
        //_carregarList(),
        future: controller.listar(),

        builder: (context, snapshot) {
          print(snapshot.data);
          return _carregarList(snapshot.data);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(Rotas.cliente);
        },
      ),
    );
  }

  Widget _myCard(Cliente cliente) {
    return Card(
      child:
          Column(mainAxisSize: MainAxisSize.min, children: _itenCard(cliente)),
    );
  }

  List<Widget> _itenCard(Cliente cliente) {
    return <Widget>[
      ListTile(
        leading: Icon(Icons.album),
        title: Text(cliente.nome),
        //${AppLocalizations.of(context).street}
        subtitle: Text(
            '${AppLocalizations.of(context).street}:  ${cliente.logradouro}, ${cliente.numero}'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: const Icon(Icons.phone),
            onPressed: () {
              fazerLigacao(cliente.telefone);
            },
          ),
          const SizedBox(width: 8),
          TextButton(
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              _alerta(cliente);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
    ];
  }

  Future _alerta(Cliente cliente) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                AppLocalizations.of(context).title_msg_delete,
              ),
              content: Text(
                  '${AppLocalizations.of(context).msg_delete_client}: ${cliente.nome} '),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context).yes),
                  onPressed: () {
                    controller.remove(cliente.id);
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text(AppLocalizations.of(context).no),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  fazerLigacao(String telefone) async {
    String url = 'tel:$telefone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
}

import 'package:conversor_app/src/controller/cliente_controller.dart';
import 'package:conversor_app/src/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ClientePage extends StatefulWidget {
  @override
  ClientePageState createState() => ClientePageState();
}

class ClientePageState extends State<ClientePage> {
  //final clienteController = ClienteController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).client),
          actions: [
            IconButton(
              icon: Icon(Icons.save), 
              onPressed: () {
                final isValid = formKey.currentState.validate();
                if (isValid){
                  formKey.currentState.save();
                }
              })],
        ),
        body: _body(context));
  }

  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2022));
    if (picked != null) setState(() => _value = picked.toString());
  }

  Widget _body(BuildContext context) {
    final ClienteController clienteController = Provider.of(context);

    Cliente cliente = Cliente();

    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _form()
          /* Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: clienteController.nome,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).name
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: clienteController.cpfCnpj,
                inputFormatters: [
                  MaskTextInputFormatter(mask: "###.###.###-##")
                ],
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).cnpjcpf,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: clienteController.cep,
                inputFormatters: [
                  MaskTextInputFormatter(mask: "##.###-###")
                ],
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).zip_code
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: clienteController.logradouro,
                onChanged: (text){
                },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).street
                ),
              ),
            ),

            TextField(
              controller: clienteController.telefone,
              onChanged: (text){
              },
              inputFormatters: [
                MaskTextInputFormatter(mask: "(##) # ####-####")
              ],
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).phone
              ),
            ),

            Text(_value),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text('CLIQUE'),
            ),

            ElevatedButton(
              onPressed: (){
                clienteController.salvar();
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            )
          ],
        ),*/
          ),
    );
  }

  Widget _form(Cliente cliente) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context).name),
            validator: (value) {
              if (value.isEmpty) {
                return 'Esse campo deve ser informado';
              }
              return null;
            },
            onSaved: (value)=>{ cliente.nome },
          )
        ],
      ),
    );
  }
}

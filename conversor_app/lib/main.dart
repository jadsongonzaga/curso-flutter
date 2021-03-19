
import 'package:conversor_app/src/controller/cliente_controller.dart';
import 'package:conversor_app/src/view/cliente_page.dart';
import 'package:conversor_app/src/view/home_page.dart';
import 'package:conversor_app/src/view/lista_cliente_page.dart';
import 'package:conversor_app/src/view/service_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClienteController() ,)
      ],
      child: MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), 
        Locale('pt')
      ],
      title: 'Cliente',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: HomePage(title: 'Teste')
     initialRoute: Rotas.home,
     routes: {
       Rotas.home : (context) => HomePage(title: 'App - Cliente'),
       Rotas.listaClientes: (context) => ListaClientePage(),
       Rotas.cliente: (context) => ClientePage(),
       Rotas.servico: (context) => ServicePage(),
     },
    );
  }
}


class Rotas{
  static final String listaClientes = '/listaClientes';
  static final String home = '/';
  static final String cliente = '/cliente';
  static final String servico = '/servico';
}
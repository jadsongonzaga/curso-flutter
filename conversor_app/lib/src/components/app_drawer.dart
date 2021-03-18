import 'package:conversor_app/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.people,
              text: AppLocalizations.of(context).client,
              onTap: (){
                Navigator.pushReplacementNamed(context, Rotas.listaClientes); 
              }),
            _createDrawerItem(
              icon: Icons.miscellaneous_services_rounded,
              text: AppLocalizations.of(context).service, 
              onTap: (){
                Navigator.pushReplacementNamed(context, Rotas.servico); 
              }),
          ],
        ),
    );
  }

  Widget _createHeader(){
    return UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network('https://avatars.githubusercontent.com/u/7542083?s=400&u=004feae90afe79e904f01068cecd89b979357db7&v=4'),
                ), 
                accountName: Text('Jadson Gonzaga'),
                accountEmail: Text('jadson.rnv@gmail.com')
              );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}){
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
            ),
        ],
      ),
      onTap: onTap,

    );
  }
}
import 'package:conversor_app/src/components/app_drawer.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço'),
      ),
      drawer: AppDrawer(),

    );
  }
}
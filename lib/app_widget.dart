import 'package:flutter/material.dart';
import 'package:flutter_app/app_controller.dart';
import 'package:flutter_app/home_page.dart';



class AppWidget extends StatelessWidget{
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child){
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDartTheme ? Brightness.dark : Brightness.light
          ),
          home: HomePage()
        );
      }
    );
  }
}

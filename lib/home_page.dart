
import 'package:flutter/material.dart';
import 'package:flutter_app/app_controller.dart';

class HomePage extends StatefulWidget{
    @override
    State<HomePage> createState() {
      return HomePageState();
    }
  }

  class HomePageState extends State<HomePage>{
    int counter = 0;
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network('https://avatars.githubusercontent.com/u/7542083?s=400&u=004feae90afe79e904f01068cecd89b979357db7&v=4'),
                ), 
                accountName: Text('Jadson Gonzaga'),
                accountEmail: Text('jadson.rnv@gmail.com')
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
                subtitle: Text('Finalizar sesão'),
                onTap:(){
                  Navigator.of(context).pushReplacementNamed('/');
                }
                )


            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [CustomSwitcher()],
        ), //Barra superior do app
        
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contador: $counter'),
              CustomSwitcher()

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
                counter++;
              });
          },
        ),
      );
    }
  }

  class CustomSwitcher extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      return Switch(
            value: AppController.instance.isDartTheme,
            onChanged: (value){
              AppController.instance.changeTheme();
            });
    }
  }

  /*
   body: Center(
          child: GestureDetector(
            child: Text('Contador: $counter', style: TextStyle(fontSize: 20),),
            onTap: ((){
              setState(() {
                counter++;
              });
            })
        )),
   */
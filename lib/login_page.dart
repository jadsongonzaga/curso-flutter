import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body(){
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 12),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (text) {
                        email = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          hintText: 'Digite seu email.'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        password = text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'Digite sua senha'),
                    ),

                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor : MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                      onPressed: () {
                        if ((email == 'jadson.rnv@gmail.com') && (password == '123')) {
                          Navigator.of(context).pushReplacementNamed('/home');

                        } else {
                          print('Incorreto');
                        }
                      },
                      child: Text('Entrar'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.red.shade50),
          _body()
        ],
    ));
  }
}

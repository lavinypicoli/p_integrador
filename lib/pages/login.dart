import 'package:flutter/material.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazer Login"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Text(
              'Preencha os dois campos abaixo para Entrar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 45.0,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains("@"))
                  return "E-mail inválido!";
              },
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              validator: (text){
                if(text.isEmpty || text.length <6)
                  return "Senha inválida!";
              },
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
              SizedBox(height: 120.0,),
            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){

                  }
                  /*
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuInicialFuncionario())
                  );
                  */
                },
                child: Text(
                  "ENTRAR",
                  style: TextStyle(
                    color: Colors.white, fontSize: 30.0,
                  ),
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp())
                  );

                },
                child: Text(
                  "VOLTAR",
                  style: TextStyle(
                    color: Colors.white, fontSize: 30.0,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class Cadastro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Aluno"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Text(
              'Preencha os quatro campos abaixo para efetuar o cadastro!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5.0,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome Completo",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              validator: (text){
                if(text.isEmpty)
                  return "Nome Completo inválido!";
              },
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Data de Nascimento",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              validator: (text){
                if(text.isEmpty)
                  return "Data de Nascimento inválida!";
              },
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains("@"))
                  return "E-mail inválido!";
              },
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              validator: (text){
                if(text.isEmpty || text.length <6)
                  return "Senha inválida!";
              },
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),

            SizedBox(height: 25.0,),

            ButtonTheme(
              height: 70.0,
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
                  "CADASTRAR",
                  style: TextStyle(
                    color: Colors.white, fontSize: 30.0,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              height: 70.0,
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
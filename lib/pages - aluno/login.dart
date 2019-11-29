import 'package:flutter/material.dart';
import 'package:p_integrador/api/apiResponse.dart';
import 'package:p_integrador/api/loginAlunoAPI.dart' as prefix0;
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/pages%20-%20aluno/menu_inicial_aluno.dart';
import 'package:p_integrador/utils/alert.dart';


import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailAluno = TextEditingController();
  final _senhaAluno = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Fazer Login"),
        ),
        body: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(5.0),
                children: <Widget>[
                  Text('Preencha os dois campos abaixo para Entrar!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  TextFormField(
                    controller: _emailAluno,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                    decoration: InputDecoration(labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  TextFormField(
                    controller: _senhaAluno,
                    decoration: InputDecoration(labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    validator: (text) {
                      if (text.isEmpty || text.length < 2)
                        return "Senha inválida!";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ButtonTheme(
                    height: 90.0,
                    child: RaisedButton(
                      onPressed: () async {
                        bool formOk = _formKey.currentState.validate();
                        if (!formOk) {
                          // não chega até no botão se um campo tiver vazio
                          return;
                        }
                        String emailaluno = _emailAluno.text;
                        String senhaaluno = _senhaAluno.text;

                        APIResponse respose = await prefix0.LoginAlunoAPI
                            .autentica(emailaluno, senhaaluno);

                        if (respose.ok) {
                          Aluno usuarioAluno = respose.result;
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  MenuInicialAluno(aluno: usuarioAluno,)));
                          print("usuario : $usuarioAluno");
                        } else {
                          alert(context, respose.msg);
                        }

                      },
                      child: Text("ENTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 30.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ButtonTheme(
                    height: 90.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Text("VOLTAR",
                        style: TextStyle(color: Colors.white, fontSize: 30.0,
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
        )
    );
  }
}


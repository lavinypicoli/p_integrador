import 'package:flutter/material.dart';
import 'package:p_integrador/api/cadastroAlunoAPI.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages%20-%20aluno/login.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import '../main.dart';
import '../pages/menu_inicial_funcionario.dart';


class Cadastro extends StatefulWidget{
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>{
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nomealuno = TextEditingController();
  final _datanasc = TextEditingController();
  final _emailaluno = TextEditingController();
  final _senhaaluno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                    style: TextStyle(fontSize: 20.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: _nomealuno,
                    decoration: InputDecoration(
                      labelText: "Nome Completo",
                        labelStyle: TextStyle(color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    validator: (text) {
                      if (text.isEmpty) return "Nome Completo inválido!";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  TextFormField(
                    controller: _datanasc,
                    decoration: InputDecoration(
                      labelText: "Data de Nascimento",
                        labelStyle: TextStyle(color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    validator: (text) {
                      if (text.isEmpty) return "Data de Nascimento inválida!";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  TextFormField(
                    controller: _emailaluno,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                    decoration: InputDecoration(
                      labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  TextFormField(
                    controller: _senhaaluno,
                    decoration: InputDecoration(
                      labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    validator: (text) {
                      if (text.isEmpty || text.length < 3)
                        return "Senha inválida!";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  SizedBox(height: 25.0),
                  ButtonTheme(
                    height: 70.0,
                    child: RaisedButton(
                      onPressed: () async {
                        bool formOk = _formKey.currentState.validate();
                        if (!formOk) {
                          //não chega até no botão se um campo tiver vazio
                          return;
                        }
                        String nomealuno = _nomealuno.text;
                        String datanasc = _datanasc.text;
                        String emailaluno = _emailaluno.text;
                        String senhaaluno = _senhaaluno.text;

                        bool ok = await CadastroAlunoApi.cadastroAluno(
                            nomealuno, datanasc, emailaluno, senhaaluno);
                        if (ok) {
                          print(
                              "Aluno: $nomealuno, $datanasc, $emailaluno, $senhaaluno ");
                          print("Cadastrou aluno");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                          //_onSuccess();
                        } else {
                          _onFail();
                          print("Não cadastrou aluno");
                        }
                      },
                      child: Text("CADASTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 10.0),
                  ButtonTheme(
                    height: 70.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Text("VOLTAR",
                          style: TextStyle(
                              color: Colors.white, fontSize: 30.0)),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuário criado com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        )
    );
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}



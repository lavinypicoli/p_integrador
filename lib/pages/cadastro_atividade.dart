import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class CadastroAtividade extends StatefulWidget {
  @override
  _CadastroAtividadeState createState() => _CadastroAtividadeState();
}

class _CadastroAtividadeState extends State<CadastroAtividade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScopedModelDescendant<UsuarioModel>(
          builder: (context, child, model) {
            return Text(
              "Olá, ${!model.isLoggedIn() ? "" : model.userData["nome"]}",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Text(
              'Preencha os quatro campos abaixo para cadastrar uma nova atividade',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome da Atividade",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Dia da Semana",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Horário",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Descrição da Atividade",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(
              height: 35.0,
            ),
            ButtonTheme(
              height: 70.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "CADASTRAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuInicialFuncionario()));
                },
                child: Text(
                  "Voltar ao Menu Inicial",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
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

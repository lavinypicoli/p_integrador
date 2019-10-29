import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class PublicarAvisos extends StatefulWidget {
  @override
  _PublicarAvisosState createState() => _PublicarAvisosState();
}

class _PublicarAvisosState extends State<PublicarAvisos> {
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
              'Preencha os três campos abaixo para publicar um novo aviso',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Texto do Aviso",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Dia da Publicação",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Horário Publicação",
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
              height: 80.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "PUBLICAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 90.0,
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

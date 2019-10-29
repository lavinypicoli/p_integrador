import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'cadastro_atividade.dart';
import 'menu_inicial_funcionario.dart';

class VisualizarAtividade extends StatelessWidget {
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
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Text(
                'Visualizar Atividades',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
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

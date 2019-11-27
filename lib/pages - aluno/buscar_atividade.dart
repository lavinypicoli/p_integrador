import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_aluno.dart';

class BuscarAtividade extends StatelessWidget {
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Buscar Atividade',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Digite o nome da Atividade",
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuInicialAluno()));
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

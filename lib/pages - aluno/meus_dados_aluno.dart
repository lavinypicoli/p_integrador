import 'package:flutter/material.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_aluno.dart';

class MeusDados extends StatelessWidget {
  final Aluno aluno;

  MeusDados({this.aluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Olá, ${aluno.nomealuno}", style: TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold))
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
                child: Text('Meus Dados',
                textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,
                        color: Colors.teal[600],
                        fontWeight: FontWeight.bold))
            ),
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Aluno: ${aluno.nomealuno}',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),

                          Text('Email: ${aluno.emailaluno}',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),

                          Text('Senha: ${aluno.senhaaluno}',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MenuInicialAluno(aluno: aluno,)));
                },
                child: Text("Voltar ao Menu Inicial",
                    style: TextStyle(color: Colors.white, fontSize: 30.0)),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages%20-%20aluno/visualizar_avisos.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';
import 'package:scoped_model/scoped_model.dart';

import 'buscar_atividade.dart';
import 'meus_dados_aluno.dart';
import 'minha_agenda.dart';

class MenuInicialAluno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UsuarioModel>(
        builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: ScopedModelDescendant<UsuarioModel>(
            builder: (context, child, model) {
              return Text(
                "Olá, ${!model.isLoggedIn() ? "" : model.userData["nome"]}",
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold));
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
                  'MENU INICIAL',
                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
              ),
              ButtonTheme(
                height: 90.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MeusDados()));
                  },
                  child: Text(
                    "Meus Dados",
                      style: TextStyle(color: Colors.white, fontSize: 30.0)),
                  color: Colors.teal[600],
                ),
              ),
              ButtonTheme(
                height: 90.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => MinhaAgenda()));
                  },
                  child: Text(
                    "Minha Agenda",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.pink[800],
                ),
              ),
              ButtonTheme(
                height: 90.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => BuscarAtividade()));
                  },
                  child: Text(
                    "Buscar Atividade",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.deepPurple,
                ),
              ),
              ButtonTheme(
                height: 90.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => VisualizarAvisosAluno()));
                  },
                  child: Text(
                    "Aviso",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.lightBlue,
                ),
              ),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => PaginaInicial()));
                  },
                  child: Text(
                    "SAIR",
                      style: TextStyle(color: Colors.white, fontSize: 30.0)),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

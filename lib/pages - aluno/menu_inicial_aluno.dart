import 'package:flutter/material.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/pages%20-%20aluno/visualizar_avisos.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';


import 'buscar_atividade.dart';
import 'meus_dados_aluno.dart';
import 'minha_agenda.dart';

class MenuInicialAluno extends StatelessWidget {

  final Aluno aluno;
  MenuInicialAluno({this.aluno});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
                "Olá, ${aluno.nomealuno}", style: TextStyle(fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold))
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
                        MaterialPageRoute(
                            builder: (context) => MeusDados(aluno: aluno,)));
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MinhaAgenda(aluno: aluno,)));
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => BuscarAtividade(aluno: aluno,)));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VisualizarAvisosAluno()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaInicial()));
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
      ),
    );
  }
}

_retornaUsuarioLogado() {

}


Future<bool> _onBackPressed() async {
  var context;
  return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: Text("Tem certeza que deseja sair?"),
        content: Text("Você irá sair do aplicativo"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Não")),
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginaInicial()),);
              },
              child: Text("Sim")),
        ],
      )
  );
}
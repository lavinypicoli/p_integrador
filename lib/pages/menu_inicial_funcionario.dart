import 'package:flutter/material.dart';
import 'package:p_integrador/model/funcionarioModel.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/model/usuario_model.dart' as prefix0;
import 'package:p_integrador/pages/pagina_inicial.dart';
import 'package:p_integrador/pages/visualizarAvisos.dart';
import 'package:p_integrador/pages/visualizar_atividades.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import '../pages - aluno/login.dart';
import 'meus_dados_funcionario.dart';

class MenuInicialFuncionario extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
          return WillPopScope(
            onWillPop: _onBackPressed,
            child: Scaffold(
              appBar: AppBar(
                  title: Text(
                    "",
                      style: TextStyle(fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                  )

              ),
              body: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text('MENU INICIAL', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ButtonTheme(
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MeusDadosFuncionario()));
                        },
                        child: Text("Meus Dados",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        color: Colors.teal[600],
                      ),
                    ),
                    ButtonTheme(
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => VisualizarAtividade()));
                        },
                        child: Text("Atividade",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                    ButtonTheme(
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => VisualizarAvisos()));
                        },
                        child: Text("Aviso",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        color: Colors.lightBlue,
                      ),
                    ),
                    ButtonTheme(
                      height: 80.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PaginaInicial()));
                        },
                        child: Text("SAIR",
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
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


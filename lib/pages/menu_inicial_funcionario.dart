import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';
import 'package:p_integrador/pages/visualizar_atividades.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'atividade_funcionario.dart';
import 'aviso_funcionario.dart';
import 'login.dart';

class MenuInicialFuncionario extends StatelessWidget {
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
                      'MENU INICIAL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ButtonTheme(
                    height: 100.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Meus Dados",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.teal[600],
                    ),
                  ),

                  ButtonTheme(
                    height: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisualizarAtividade())
                        );
                      },
                      child: Text(
                        "Atividade",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.purple,
                    ),
                  ),

                  ButtonTheme(
                    height: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => AvisoFuncionario()));
                      },
                      child: Text(
                        "Aviso",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.lightBlue,
                    ),
                  ),

                  ButtonTheme(
                    height: 80.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (!model.isLoggedIn())
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        else
                          model.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => PaginaInicial()));
                      },
                      child: Text(
                        "SAIR",
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
    );
  }
}


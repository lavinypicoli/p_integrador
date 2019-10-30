import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_aluno.dart';

class LoginAluno extends StatefulWidget {
  @override
  _LoginAlunoState createState() => _LoginAlunoState();
}

class _LoginAlunoState extends State<LoginAluno> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Fazer Login"),
        ),
        body: ScopedModelDescendant<UsuarioModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(5.0),
                children: <Widget>[
                  Text(
                    'Preencha os dois campos abaixo para Entrar!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha inválida!";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  SizedBox(
                    height: 120.0,
                  ),
                  ButtonTheme(
                    height: 80.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuInicialAluno()));
                      },
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonTheme(
                    height: 80.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaginaInicial()));
                      },
                      child: Text(
                        "VOLTAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaginaInicial()));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }
}
import 'package:flutter/material.dart';
import 'package:p_integrador/pages/login_funcionario.dart';

import '../pages - aluno/cadastro_aluno.dart';
import '../pages - aluno/login.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Voice"),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              VoiceImageAsset(),
              Center(
                child: Text('Bem-vindo(a) ao Voice!',
                    style: TextStyle(fontSize: 30,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold)),
              ),

              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("FAZER LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 30.0)),
                  color: Colors.green,
                ),
              ),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cadastro())
                    );
                  },
                  child: Text("EFETUAR CADASTRO",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              ButtonTheme(
                height: 70.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginFuncionario())
                    );
                  },
                  child: Text("Área Restrita ao Funcionário",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  color: Colors.blueGrey[800],
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


class VoiceImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/voice.png');
    Image image = Image(image: assetImage, width: 200.0, height: 200.0,);
    return Container(child: image,);
  }
}

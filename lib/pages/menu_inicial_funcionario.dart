import 'package:flutter/material.dart';

import '../main.dart';
import 'atividade_funcionario.dart';

class MenuInicialFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: VoiceImageAsset(),
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
                color: Colors.yellow,
              ),
            ),

            ButtonTheme(
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AtividadeFuncionario())
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
                onPressed: () {},
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
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
}
class VoiceImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/voice.png');
    Image image = Image(image: assetImage, width: 95.0, height: 95.0,);
    return Container(child: image,);
  }
}

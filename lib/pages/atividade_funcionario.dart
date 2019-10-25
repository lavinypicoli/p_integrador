import 'package:flutter/material.dart';

import '../main.dart';

class AtividadeFuncionario extends StatelessWidget {
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
                'ATIVIDADE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


            ButtonTheme(
              height: 130.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Cadastrar Atividade",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                color: Colors.lightGreen,
              ),
            ),

            ButtonTheme(
              height: 130.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Visualizar Atividade",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                color: Colors.orangeAccent,
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
class VoiceImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/voice.png');
    Image image = Image(image: assetImage, width: 95.0, height: 95.0,);
    return Container(child: image,);
  }
}
import 'package:flutter/material.dart';

import 'cadastro_aluno.dart';
import 'login.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: (){
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
                onPressed: (){
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
    Image image = Image(image: assetImage, width: 300.0, height: 300.0,);
    return Container(child: image,);
  }
}

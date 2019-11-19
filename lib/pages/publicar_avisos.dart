import 'package:flutter/material.dart';
import 'package:p_integrador/api/publicaAvisoAPI.dart';

import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/visualizarAvisos.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class PublicarAvisos extends StatefulWidget {

  @override
  _PublicarAvisosState createState() => _PublicarAvisosState();
}

class _PublicarAvisosState extends State<PublicarAvisos> {

  final _textoaviso = TextEditingController();
  final _dataaviso = TextEditingController();
  final _horaaviso = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: _requestPop,
      child: Scaffold(
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
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              Text('Preencha os três campos abaixo para publicar um novo aviso',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _textoaviso,
                decoration: InputDecoration(
                    labelText: "Texto do Aviso",
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _dataaviso,
                decoration: InputDecoration(
                    labelText: "Dia da Publicação",
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _horaaviso,
                decoration: InputDecoration(
                  labelText: "Horário Publicação",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(height: 35.0),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () async {
                    bool formOk = _formKey.currentState.validate();
                    if (!formOk) {
                      //não chega até no botão se um campo tiver vazio
                      return;
                    }
                    String textoaviso = _textoaviso.text;
                    String dataaviso = _dataaviso.text;
                    String horaaviso = _horaaviso.text;

                    bool ok = await PublicaAvisoApi.publicaAviso(
                        textoaviso, dataaviso, horaaviso);
                    if (ok) {
                      print("Aviso: $textoaviso, $dataaviso, $horaaviso");
                      print("publicou aviso");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => VisualizarAvisos()));
                    } else {
                      print("Não publicou aviso");
                    }
                  },
                  child: Text("PUBLICAR",
                    style: TextStyle(color: Colors.white, fontSize: 30.0,
                    ),
                  ),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 90.0,
              ),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MenuInicialFuncionario()));
                  },
                  child: Text("Voltar ao Menu Inicial",
                      style: TextStyle(color: Colors.white, fontSize: 30.0)
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

/*
  Future<bool> _requestPop() async {
    if (_userEdited) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Deseja mesmo descartar as alterações?"),
          content: Text("Se sair as alterações serão perdidas."),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
*/

}

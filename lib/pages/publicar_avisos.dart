import 'package:flutter/material.dart';
import 'package:p_integrador/controller/aviso_controller.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class PublicarAvisos extends StatefulWidget {
  final Aviso aviso;

  PublicarAvisos({this.aviso});


  @override
  _PublicarAvisosState createState() => _PublicarAvisosState();
}

class _PublicarAvisosState extends State<PublicarAvisos> {
  Aviso aviso;
  List<Aviso> avisos = List();
  AvisoController controller = AvisoController();

  final _textoController = TextEditingController();
  final _diaController = TextEditingController();
  final _horaController = TextEditingController();

  bool _userEdited = false;

  Aviso _editedAviso;

  @override
  void initState() {
    super.initState();
    if (widget.aviso == null) {
      _editedAviso = Aviso();
    } else {
      _editedAviso = Aviso.fromMap(widget.aviso.toMap());

      _textoController.text = _editedAviso.textopubli;
      _diaController.text = _editedAviso.diapubli;
      _horaController.text = _editedAviso.horapubli;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
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
          child: ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              Text(
                'Preencha os três campos abaixo para publicar um novo aviso',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _textoController,
                decoration: InputDecoration(
                  labelText: "Texto do Aviso",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAviso.textopubli = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _diaController,
                decoration: InputDecoration(
                  labelText: "Dia da Publicação",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAviso.diapubli = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _horaController,
                decoration: InputDecoration(
                  labelText: "Horário Publicação",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAviso.horapubli = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(
                height: 35.0,
              ),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_editedAviso.textopubli.isNotEmpty) {
                      Navigator.pop(context, _editedAviso);
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

}

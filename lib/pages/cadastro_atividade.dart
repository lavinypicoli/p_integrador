import 'package:flutter/material.dart';
import 'package:p_integrador/api/CadastroAtividadeAPI.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/visualizar_atividades.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class CadastroAtividade extends StatefulWidget {

  @override
  _CadastroAtividadeState createState() => _CadastroAtividadeState();
}

class _CadastroAtividadeState extends State<CadastroAtividade> {

  final _nomeativ = TextEditingController();
  final _diaativ = TextEditingController();
  final _horaativ = TextEditingController();
  final _descricaoativ = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: _requestPop,
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
              Text(
                'Preencha os quatro campos abaixo para cadastrar uma nova atividade',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: _nomeativ,
                decoration: InputDecoration(labelText: "Nome da Atividade",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _diaativ,
                decoration: InputDecoration(labelText: "Dia da Semana",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _horaativ,
                decoration: InputDecoration(labelText: "Horário",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _descricaoativ,
                decoration: InputDecoration(labelText: "Descrição da Atividade",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(
                height: 35.0,
              ),
              ButtonTheme(
                height: 70.0,
                child: RaisedButton(
                  onPressed: () async {
                    bool formOk = _formKey.currentState.validate();
                    if (!formOk) {
                      // não chega até no botão se um campo tiver vazio
                      return;
                    }
                    String nomeativ = _nomeativ.text;
                    String diaativ = _diaativ.text;
                    String horaativ = _horaativ.text;
                    String descricaoativ = _descricaoativ.text;

                    bool ok = await CadastroAtividadeApi.cadastraAtividade(
                        nomeativ, diaativ, horaativ, descricaoativ);
                    if (ok) {
                      print(
                          "Atividade: $nomeativ, $diaativ, $horaativ, $descricaoativ");
                      print("Cadastrou atividade");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => VisualizarAtividade()));
                    } else {
                      print("Não cadastrou atividade");
                    }
                  },
                  child: Text("CADASTRAR",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              ButtonTheme(
                height: 80.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MenuInicialFuncionario()));
                  },
                  child: Text("Voltar ao Menu Inicial",
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

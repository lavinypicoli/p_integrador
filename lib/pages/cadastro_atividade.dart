import 'package:flutter/material.dart';
import 'package:p_integrador/controller/atividade_controller.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/visualizar_atividades.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'menu_inicial_funcionario.dart';

class CadastroAtividade extends StatefulWidget {

  final Atividade atividade;

  CadastroAtividade({this.atividade});

  @override
  _CadastroAtividadeState createState() => _CadastroAtividadeState();
}

class _CadastroAtividadeState extends State<CadastroAtividade> {
  Atividade atividade;
  List<Atividade> atividades = List();

  AtividadeController controller = AtividadeController();

  final _nomeAtividadeController = TextEditingController();
  final _diaSemanaController = TextEditingController();
  final _horarioController = TextEditingController();
  final _descricaoController = TextEditingController();

  bool _userEdited = false;

  Atividade _editedAtividade;

  @override
  void initState() {
    super.initState();
    if (widget.atividade == null) {
      _editedAtividade = Atividade();
    } else {
      _editedAtividade = Atividade.fromMap(widget.atividade.toMap());

      _nomeAtividadeController.text = _editedAtividade.nomeAtividade;
      _diaSemanaController.text = _editedAtividade.diaSemana;
      _horarioController.text = _editedAtividade.horario;
      _descricaoController.text = _editedAtividade.descricao;
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
                    fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        body: Form(
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
                controller: _nomeAtividadeController,
                decoration: InputDecoration(labelText: "Nome da Atividade",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAtividade.nomeAtividade = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _diaSemanaController,
                decoration: InputDecoration(labelText: "Dia da Semana",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAtividade.diaSemana = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _horarioController,
                decoration: InputDecoration(labelText: "Horário",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAtividade.horario = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: "Descrição da Atividade",
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedAtividade.descricao = text;
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo),
              ),
              SizedBox(
                height: 35.0,
              ),
              ButtonTheme(
                height: 70.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_editedAtividade.nomeAtividade.isNotEmpty) {
                      Navigator.pop(context, _editedAtividade);
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

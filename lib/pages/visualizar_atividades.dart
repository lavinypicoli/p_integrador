import 'package:flutter/material.dart';
import 'package:p_integrador/api/listaAtividadeAPI.dart';
import 'dart:convert';
import 'package:p_integrador/model/atividadeModel.dart';
import 'package:p_integrador/model/funcionarioModel.dart';
import 'cadastro_atividade.dart';

class VisualizarAtividade extends StatefulWidget {
  final Funcionario funcionario;
  final Atividade atividade;


  VisualizarAtividade({this.funcionario, this.atividade});

  @override
  _VisualizarAtividadeState createState() =>
      _VisualizarAtividadeState(funcionario: funcionario, atividade: atividade);
}

class _VisualizarAtividadeState extends State<VisualizarAtividade> {

  final Funcionario funcionario;
  final Atividade atividade;

  _VisualizarAtividadeState({this.funcionario, this.atividade});


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CadastroAtividade(funcionario: funcionario,)));
        },
        label: Text('Cadastrar nova atividade',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(),
        backgroundColor: Colors.blue,
      ),
    );
  }

  _body() {
    Future<List<Atividade>> future = ListaAtividadeAPI.getAtividade();

    return FutureBuilder(
      future: ListaAtividadeAPI.getAtividade(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("Não foi possível encontrar atividades",
                style: TextStyle(color: Colors.red, fontSize: 15.0)),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Atividade> atividades = snapshot.data;
        return _listView(atividades);
      },
    );
  }

  Container _listView(List<Atividade> atividades) {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: atividades != null ? atividades.length : 0,
          itemBuilder: (context, index) {
            Atividade a = atividades[index];
            return PopupMenuButton<String>(
              onSelected: (value) {
                _onClickPopupMenu(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "Editar",
                    child: Text("Editar"),
                  ),
                  PopupMenuItem(
                    value: "Deletar",
                    child: Text("Deletar"),
                  ),
                ];
              },
              child: Card(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Atividade: ' + a.nomeativ ?? "",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left),

                            Text('Dia da Semana: ' + a.diaativ ?? "",
                              style: TextStyle(fontSize: 18.0),
                            ),

                            Text('Horário: ' + a.horaativ ?? "",
                              style: TextStyle(fontSize: 18.0),
                            ),

                            Text('Descrição: ' + a.descricaoativ ?? "",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  void _onClickPopupMenu(String value) {
    print("_onClickPopupMenu > $value");
    if ("Editar" == value) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => CadastroAtividade(atividade: atividade,)));
    }
  }


}



import 'package:flutter/material.dart';
import 'package:p_integrador/api/listaAtividadeAPI.dart';
import 'dart:convert';
import 'package:p_integrador/model/atividadeModel.dart';
import 'cadastro_atividade.dart';

class VisualizarAtividade extends StatefulWidget {

  @override
  _VisualizarAtividadeState createState() => _VisualizarAtividadeState();
}

class _VisualizarAtividadeState extends State<VisualizarAtividade> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroAtividade()));
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
            return Card(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Atividade: ' + a.nomeativ ?? "",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),

                          Text('Dia da Semana: ' + a.diaativ ?? "",
                            style: TextStyle(fontSize: 20.0),
                          ),

                          Text('Horário: ' + a.horaativ ?? "",
                            style: TextStyle(fontSize: 20.0),
                          ),

                          Text('Descrição: ' + a.descricaoativ ?? "",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

}



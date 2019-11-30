import 'package:flutter/material.dart';
import 'package:p_integrador/api/listaAtividadeAPI.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/model/atividadeModel.dart';
import 'package:p_integrador/pages%20-%20aluno/AtivListView.dart';

class AtividadeSearch extends SearchDelegate<Atividade> {

  final Aluno aluno;

  AtividadeSearch({this.aluno});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length > 2) {
      return FutureBuilder(
          future: ListaAtividadeAPI.search(query),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Atividade> atividades = snapshot.data;
              return AtivListView(atividades, search: true, aluno: this.aluno,);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}

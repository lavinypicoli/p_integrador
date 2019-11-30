import 'package:flutter/material.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/model/atividadeModel.dart';
import 'package:p_integrador/pages%20-%20aluno/AtividadeSearch.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:p_integrador/utils/alert.dart';
import 'package:p_integrador/utils/alert.dart' as prefix0;


import '../main.dart';
import 'menu_inicial_aluno.dart';

class BuscarAtividade extends StatefulWidget {

  final Aluno aluno;

  BuscarAtividade({this.aluno});


  retornaAluno() {
    print("VE SE VEIO A PORRA DO ALUNO $aluno");
    return aluno;
  }

  @override
  _BuscarAtividadeState createState() => _BuscarAtividadeState(aluno: aluno);

}

class _BuscarAtividadeState extends State<BuscarAtividade> {
  final Aluno aluno;
  _BuscarAtividadeState({this.aluno});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(
            fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _onClickSearch,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 65),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Buscar Atividade',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _onClickSearch() async {
    /* final a = retornaAlunoLogado();
    print(a);*/
    final atividade = await showSearch<Atividade>(
        context: context, delegate: AtividadeSearch(aluno: aluno));


    if (atividade != null) {
      var alert = prefix0.alert(context, "Busca", atividade.nomeativ);
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  retornaAlunoLogado() {

  }


}



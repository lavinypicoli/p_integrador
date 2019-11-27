import 'package:flutter/material.dart';
import 'package:p_integrador/model/atividadeModel.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages%20-%20aluno/AtividadeSearch.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:p_integrador/utils/alert.dart';
import 'package:p_integrador/utils/alert.dart' as prefix0;


import '../main.dart';
import 'menu_inicial_aluno.dart';

class BuscarAtividade extends StatefulWidget {

  @override
  _BuscarAtividadeState createState() => _BuscarAtividadeState();

}

class _BuscarAtividadeState extends State<BuscarAtividade> {


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
        padding: EdgeInsets.all(15.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Buscar Atividade',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50.0,),
            SizedBox(height: 285.0,),
            ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MenuInicialAluno()));
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

  _onClickSearch() async {
    var context;
    final atividade = await showSearch<Atividade>(
        context: context, delegate: AtividadeSearch());
    if (atividade != null) {
      var alert = prefix0.alert(context, "Busca", atividade.nomeativ);
    }
  }


}



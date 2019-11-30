
import 'package:flutter/material.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/pages%20-%20aluno/menu_inicial_aluno.dart';

class MinhaAgenda extends StatefulWidget {

  final Aluno aluno;

  MinhaAgenda({this.aluno});

  @override
  _MinhaAgendaState createState() => _MinhaAgendaState();
}

class _MinhaAgendaState extends State<MinhaAgenda> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("", style: TextStyle(fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),)
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Text(
                'Minha Agenda',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold),
              ),
            ),
            /*     ButtonTheme(
              height: 80.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuInicialAluno()));
                },
                child: Text("Voltar ao Menu Inicial",
                  style: TextStyle(color: Colors.white, fontSize: 30.0,),
                ),
                color: Colors.red,
              ),
            ),*/
          ],
        ),
      ),
    );
  }


}


import 'package:flutter/material.dart';
import 'package:p_integrador/controller/atividade_controller.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  AtividadeController controller = AtividadeController();

  @override
  void initState() {
    super.initState();

    Atividade atividade = Atividade();
    atividade.nomeAtividade = "Laviny";
    atividade.diaSemana = "Terça";

    var saveAtividade = controller.saveAtividade(atividade);
    var then = controller.getAllAtividade().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "Olá, ",
        style: TextStyle(
            fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    )
        /*

              ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: atividades.length,
          itemBuilder: (context, index){
            return _atividadeCard(context, index);
          }
      )


          */
        );
  }
}
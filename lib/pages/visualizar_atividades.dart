import 'package:flutter/material.dart';
import 'package:p_integrador/controller/atividade_controller.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';
import 'cadastro_atividade.dart';
import 'menu_inicial_funcionario.dart';

class VisualizarAtividade extends StatefulWidget {
  @override
  _VisualizarAtividadeState createState() => _VisualizarAtividadeState();
}

class _VisualizarAtividadeState extends State<VisualizarAtividade> {
  AtividadeController controller = AtividadeController();
  List<Atividade> atividades = List();


  @override
  void initState() {
    super.initState();
    controller.getAllAtividade().then((list) {
      setState(() {
        atividades = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScopedModelDescendant<UsuarioModel>(
          builder: (context, child, model) {
            return Text(
              "Olá, ${!model.isLoggedIn() ? "" : model.userData["nome"]}",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      body:
      ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: atividades.length,
          itemBuilder: (context, index) {
            return _atividadeCard(context, index);
          }
      ),

    );
  }

  Widget _atividadeCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(atividades[index].nomeAtividade ?? "",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left
                    ),

                    Text(atividades[index].diaSemana ?? "",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(atividades[index].horario ?? "",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(atividades[index].descricao ?? "",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
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
}



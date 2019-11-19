import 'package:flutter/material.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'cadastro_atividade.dart';
import 'menu_inicial_funcionario.dart';


class VisualizarAtividade extends StatefulWidget {
  @override
  _VisualizarAtividadeState createState() => _VisualizarAtividadeState();
}

class _VisualizarAtividadeState extends State<VisualizarAtividade> {

  @override
  void initState() {
    super.initState();
    //  _getAllAtividades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      /*
      body: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: atividades.length,
          itemBuilder: (context, index) {
            return _atividadeCard(context, index);
          }
      ),
    */
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
                    /*

                    Text(atividades[index].nomeAtividade ?? "",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left
                    ),
                    Text(atividades[index].diaSemana ?? "",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(atividades[index].horario ?? "",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(   atividades[index].descricao ?? "",
                      style: TextStyle(fontSize: 20.0),
                    ),

                 */

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        // _showOptions(context, index);
      },
    );
  }
/*
  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Editar",
                        style: TextStyle(color: Colors.orange, fontSize: 40.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _showAtividadePage(atividade: atividades[index]);
                      },
                    ),
                    FlatButton(
                      child: Text("Excluir",
                        style: TextStyle(color: Colors.red, fontSize: 40.0),
                      ),
                      onPressed: () {
                        controller.deleteAtividade(
                            atividades[index].idAtividade);
                        setState(() {
                          atividades.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
    );
  }


  void _showAtividadePage({Atividade atividade}) async {
    final recAtividade = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CadastroAtividade(atividade: atividade,)));
    if (recAtividade != null) {
      if (atividade != null) {
        var i = await controller.updateAtividade(recAtividade);
      } else {
        await controller.saveAtividade(recAtividade);
      }
      _getAllAtividades();
    }
  }

  void _getAllAtividades() {
    controller.getAllAtividade().then((list) {
      setState(() {
        atividades = list;
      });
    });
  }
*/

}



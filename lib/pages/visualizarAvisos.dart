import 'package:flutter/material.dart';
import 'package:p_integrador/controller/aviso_controller.dart';
import 'package:p_integrador/model/usuario_model.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';
import 'package:scoped_model/scoped_model.dart';

class VisualizarAvisos extends StatefulWidget {
  @override
  _VisualizarAvisosState createState() => _VisualizarAvisosState();
}

class _VisualizarAvisosState extends State<VisualizarAvisos> {
  AvisoController controller = AvisoController();

  List<Aviso> avisos = List();

  @override
  void initState() {
    super.initState();
    _getAllAvisos();
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
                    fontWeight: FontWeight.bold));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAvisoPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemCount: avisos.length,
        itemBuilder: (context, index) {
          return _avisoCard(context, index);
        },
      ),
    );
  }

  Widget _avisoCard(BuildContext context, int index) {
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
                    Text(avisos[index].textopubli ?? "",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    Text(
                      avisos[index].diapubli ?? "",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      avisos[index].horapubli ?? "",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

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
                      child: Text(
                        "Editar",
                        style: TextStyle(color: Colors.orange, fontSize: 40.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _showAvisoPage(aviso: avisos[index]);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Excluir",
                        style: TextStyle(color: Colors.red, fontSize: 40.0),
                      ),
                      onPressed: () {
                        controller.deleteAviso(avisos[index].idAviso);
                        setState(() {
                          avisos.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void _showAvisoPage({Aviso aviso}) async {
    final recAviso = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PublicarAvisos(aviso: aviso)));
    if (recAviso != null) {
      if (aviso != null) {
        var i = await controller.updateAviso(recAviso);
      } else {
        await controller.saveAviso(recAviso);
      }
      _getAllAvisos();
    }
  }

  void _getAllAvisos() {
    controller.getAllAviso().then((list) {
      setState(() {
        avisos = list;
      });
    });
  }
}

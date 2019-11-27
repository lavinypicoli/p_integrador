import 'package:flutter/material.dart';
import 'package:p_integrador/api/listaAvisoAPI.dart';
import 'package:p_integrador/model/avisoModel.dart';
import 'package:p_integrador/pages/publicar_avisos.dart';


class VisualizarAvisos extends StatefulWidget {
  @override
  _VisualizarAvisosState createState() => _VisualizarAvisosState();
}

class _VisualizarAvisosState extends State<VisualizarAvisos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("",
            style: TextStyle(fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PublicarAvisos()));
        },
        label: Text('Publicar novo aviso',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  _body() {
    Future<List<Aviso>> future = ListaAvisoAPI.getAviso();

    return FutureBuilder(
      future: ListaAvisoAPI.getAviso(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text("Não foi possível encontrar avisos",
              style: TextStyle(color: Colors.red, fontSize: 15.0)),
          );
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<Aviso> avisos = snapshot.data;
        return _listAviso(avisos);
      },
    );
  }

  Container _listAviso(List<Aviso> avisos) {
    return Container(
      padding: EdgeInsets.only(left: 1.0),
      child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: avisos != null ? avisos.length : 0,
          itemBuilder: (context, index) {
            Aviso a = avisos[index];
            return Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Aviso: ' + a.textoaviso ?? "",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),

                          Text('Data: ' + a.dataaviso ?? "",
                            style: TextStyle(fontSize: 20.0),
                          ),

                          Text('Hora: ' + a.horaaviso ?? "",
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_integrador/model/atividadeModel.dart';

class AtivListView extends StatelessWidget {
  final List<Atividade> atividades;
  final bool search;

  const AtivListView(this.atividades, {this.search = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: atividades.length,
        itemBuilder: (context, index) {
          //Atividade
          final a = atividades[index];
          return Container(
            height: 150,
            child: InkWell(
              onTap: () {
                _onClickAtividade(context, a);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          a.nomeativ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Participaar'),
                              onPressed: () {
                                _onClickAtividade(context, a);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _onClickAtividade(BuildContext context, Atividade a) async {
    if (search) {
      Navigator.pop(context, a);
    } else {
      print("NÃO FUNCIONOU ESSA CARALHA");
    }
  }
}

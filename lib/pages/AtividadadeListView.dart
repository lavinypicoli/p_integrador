import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:p_integrador/model/atividadeModel.dart';
import 'package:p_integrador/pages/visualizar_atividades.dart';

class AtividadeListView extends StatefulWidget {
  final List<Atividade> atividades;

  final bool search;

  final ScrollController scrollController;

  final bool showProgress;

  final bool scrollToTheEnd;

  const AtividadeListView(this.atividades,
      {this.search = false,
      this.scrollController,
      this.showProgress = false,
      this.scrollToTheEnd = false});

  @override
  _AtividadeListViewState createState() => _AtividadeListViewState();
}

class _AtividadeListViewState extends State<AtividadeListView> {
  ScrollController get scrollController => widget.scrollController;

  bool get showProgress => widget.showProgress;

  List<Atividade> get atividades => widget.atividades;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollToTheEnd) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: showProgress ? atividades.length + 1 : atividades.length,
      itemBuilder: (ctx, idx) {
        if (showProgress && atividades.length == idx) {
          return Container(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Carro
        final a = widget.atividades[idx];
        return Container(
          height: 280,
          child: InkWell(
            onTap: () {
              _onClickAtividade(context, a);
            },
            onLongPress: () {
              //  _onLongClickCarro(context, a);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      a.nomeativ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      a.diaativ,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      a.horaativ,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      a.descricaoativ,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('PARTICIPAR'),
                            onPressed: () {
                              _onClickAtividade(context, a);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /* void _onLongClickCarro(BuildContext context, Carro c) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  c.nome,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text("Detalhes"),
                leading: Icon(Icons.directions_car),
                onTap: () {
                  pop(context);
                  _onClickCarro(context, c);
                },
              ),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
                onTap: () {
                  pop(context);
                  _onClickShare(context, c);
                },
              )
            ],
          );
        });
  }*/

  _onClickAtividade(BuildContext context, Atividade atividade) async {
    if (widget.search) {
      // Retorna da busca
      Navigator.pop(context, atividade);
    }
    /*else {
      // Navega para a tela de detlahes
      Atividade a = await Navigator.push(context, VisualizarAtividade(atividade));
      if(a != null) {
        // Remove o carro excluído da lista
        widget.atividades.remove(atividade);
        setState(() {});
      }
    }*/
  }
}

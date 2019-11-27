import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:p_integrador/model/atividadeModel.dart';

class ListaAtividadeAPI {
  static Future<List<Atividade>> getAtividade() async {
    var url = 'http://192.168.15.3:8080/atividade';

    // print("GET> $url");

    var response = await http.get(url);
    String json = response.body;
    // print(json);

    List list = convert.json.decode(json);

    final atividades = List<Atividade>();

    for (Map map in list) {
      Atividade atividade = Atividade.fromJson(map);
      atividades.add(atividade);
    }

    return atividades;
  }
}

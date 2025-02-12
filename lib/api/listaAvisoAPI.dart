import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:p_integrador/model/avisoModel.dart';

class ListaAvisoAPI {
  static Future<List<Aviso>> getAviso() async {
    var url = 'https://voice-projetointegrador.herokuapp.com/aviso';

    var response = await http.get(url);
    String json = response.body;

    List list = convert.json.decode(json);

    final avisos = List<Aviso>();

    for (Map map in list) {
      Aviso aviso = Aviso.fromJson(map);
      avisos.add(aviso);
    }

    return avisos;
  }
}

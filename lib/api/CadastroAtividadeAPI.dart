
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:p_integrador/api/apiResponse.dart';
import 'package:p_integrador/model/atividadeModel.dart';

class CadastroAtividadeApi {
  static Future<bool> cadastraAtividade(String nomeativ, String diaativ,
      String horaativ, String descricaoativ) async {
    var url = 'https://voice-projetointegrador.herokuapp.com/atividade/save';

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {
      "nomeativ": nomeativ,
      "diaativ": diaativ,
      "horaativ": horaativ,
      "descricaoativ": descricaoativ,
    };

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return true;
  }
}

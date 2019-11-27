import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CadastroAtividadeApi {
  static Future<bool> cadastraAtividade(String nomeativ, String diaativ,
      String horaativ, String descricaoativ) async {
    var url = 'http://192.168.15.3:8080/atividade/save';

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

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CadastroAviso {
  static Future<bool> cadastroAviso(
      String textoaviso, String dataaviso, String horaaviso) async {
    var url = 'http://192.168.0.8:8080/aviso/save';

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {
      "textoaviso": textoaviso,
      "dataaviso": dataaviso,
      "horaaviso": horaaviso
    };

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}

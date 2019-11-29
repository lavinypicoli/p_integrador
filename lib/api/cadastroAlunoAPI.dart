import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CadastroAlunoApi {

  static Future<bool> cadastroAluno(String nomealuno, String datanasc,
      String emailaluno, String senhaaluno) async {
    var url = 'http://172.21.14.163:8080/aluno/save';

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Map params = {
      "nomealuno": nomealuno,
      "datanasc": datanasc,
      "emailaluno": emailaluno,
      "senhaaluno": senhaaluno
    };

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }

}
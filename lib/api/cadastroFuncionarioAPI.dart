import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CadastroFuncionarioApi {

  static Future<bool> cadastraFuncionario(String nomefunc, String emailfunc,
      String senhafunc) async {
    var url = 'http://127.0.0.1:8080/funcionario/save';

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Map params = {
      "nomefunc": nomefunc,
      "emailfunc": emailfunc,
      "senhafunc": senhafunc
    };

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }


}
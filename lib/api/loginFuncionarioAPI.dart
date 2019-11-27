import 'dart:convert';

import 'package:p_integrador/model/funcionarioModel.dart';
import 'package:http/http.dart' as http;

class LoginFuncionarioAPI {
  static Future<Funcionario> autentica(String emailfunc,
      String senhafunc) async {
    var url = 'http://192.168.25.9:8080/funcionario/autentica';

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {"emailfunc": emailfunc, "senhafunc": senhafunc};

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = jsonDecode(response.body);

    final usuarioFunc = Funcionario(mapResponse);

    return usuarioFunc;
  }
}

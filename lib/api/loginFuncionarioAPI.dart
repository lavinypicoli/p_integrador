import 'dart:convert';

import 'package:p_integrador/api/apiResponse.dart';
import 'package:p_integrador/model/funcionarioModel.dart';
import 'package:http/http.dart' as http;

class LoginFuncionarioAPI {
  static Future<APIResponse<Funcionario>> autentica(String emailfunc,
      String senhafunc) async {
    try {
      var url = 'https://voice-projetointegrador.herokuapp.com/funcionario/autentica';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"emailfunc": emailfunc, "senhafunc": senhafunc};

      String s = jsonEncode(params);

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final usuarioFunc = Funcionario(mapResponse);

        print(usuarioFunc);

        return APIResponse.ok(usuarioFunc);
      }
      return APIResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");
      return APIResponse.error("Não foi possível efetuar login");
    }
  }
}

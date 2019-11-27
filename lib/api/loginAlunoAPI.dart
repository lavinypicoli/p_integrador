import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p_integrador/api/apiResponse.dart';
import 'package:p_integrador/model/alunoModel.dart';

class LoginAlunoAPI {
  static Future<APIResponse<Aluno>> autentica(String emailaluno,
      String senhaaluno) async {
    try {
      var url = 'http://192.168.15.3:8080/aluno/autentica';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"emailaluno": emailaluno, "senhaaluno": senhaaluno};

      String s = jsonEncode(params);

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final usuarioAluno = Aluno(mapResponse);

        return APIResponse.ok(usuarioAluno);
      }
    } catch (error, exception) {
      print("Erro no login $error > $exception");
      return APIResponse.error("Não foi possível efetuar login");
    }
  }
}

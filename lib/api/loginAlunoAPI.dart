import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p_integrador/model/alunoModel.dart';

class LoginAlunoAPI {
  static Future<Aluno> autentica(String emailaluno, String senhaaluno) async {
    var url = 'http://192.168.25.9:8080/aluno/autentica';

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {"emailaluno": emailaluno, "senhaaluno": senhaaluno};

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = jsonDecode(response.body);

    final usuarioAluno = Aluno(mapResponse);

    return usuarioAluno;
  }
}

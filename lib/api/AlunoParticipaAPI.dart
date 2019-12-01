import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p_integrador/model/AlunoParticipaDTO.dart';
import 'package:p_integrador/model/alunoModel.dart';
import 'package:p_integrador/model/atividadeModel.dart';

class AlunoParticipaAPI {
  static Future<bool> salvaQuemParticipa(Atividade atividade,
      Aluno aluno) async {
    var url = 'https://voice-projetointegrador.herokuapp.com/alunoparticipa/salvaParticipa';

    int idatividadep = atividade.idativ;
    int idalunop = aluno.idaluno;
    print(idalunop);
    print(idatividadep);

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params = {
      "idatividadep": idatividadep,
      "idalunop": idalunop,
    };
    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return true;
  }
}

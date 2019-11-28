import 'package:flutter/material.dart';
import 'package:p_integrador/pages%20-%20aluno/buscar_atividade.dart';
import 'package:p_integrador/pages%20-%20aluno/cadastro_aluno.dart';
import 'package:p_integrador/pages/cadastro_atividade.dart';
import 'package:p_integrador/pages%20-%20aluno/login.dart';
import 'package:p_integrador/pages/menu_inicial_funcionario.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BuscarAtividade(),
    );
  }
}

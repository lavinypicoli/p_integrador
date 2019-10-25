import 'package:flutter/material.dart';
import 'package:p_integrador/pages/cadastro_aluno.dart';
import 'package:p_integrador/pages/login.dart';
import 'package:p_integrador/pages/menu_inicial_funcionario.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
    );
  }
}

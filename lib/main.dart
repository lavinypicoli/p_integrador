import 'package:flutter/material.dart';
import 'package:p_integrador/pages/cadastro_aluno.dart';
import 'package:p_integrador/pages/cadastro_atividade.dart';
import 'package:p_integrador/pages/login.dart';
import 'package:p_integrador/pages/menu_inicial_funcionario.dart';
import 'package:p_integrador/pages/pagina_inicial.dart';
import 'package:p_integrador/pages/teste.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/usuario_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UsuarioModel>(
      model: UsuarioModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PaginaInicial(),
        ),
    );
  }
}

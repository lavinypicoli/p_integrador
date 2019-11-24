class Funcionario {
  String nomefunc;
  String emailfunc;
  String senhafunc;

  Funcionario(Map<String, dynamic> map) {
    nomefunc = map["nomefunc"];
    emailfunc = map["emailfunc"];
    senhafunc = map["senhafunc"];
  }

  @override
  String toString() {
    return 'Funcionario{nomefunc: $nomefunc, emailfunc: $emailfunc, senhafunc: $senhafunc}';
  }
}

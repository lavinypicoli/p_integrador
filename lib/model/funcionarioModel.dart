class Funcionario {
  int idfunc;
  String nomefunc;
  String emailfunc;
  String senhafunc;

  Funcionario(Map<String, dynamic> map) {
    idfunc = map["idfunc"];
    nomefunc = map["nomefunc"];
    emailfunc = map["emailfunc"];
    senhafunc = map["senhafunc"];
  }

  @override
  String toString() {
    return 'Funcionario{idfunc: $idfunc nomefunc: $nomefunc, emailfunc: $emailfunc, senhafunc: $senhafunc}';
  }
}

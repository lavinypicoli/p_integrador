class Aluno {
  int idaluno;
  String nomealuno;
  String datanasc;
  String emailaluno;
  String senhaaluno;

  Aluno(Map<String, dynamic> map) {
    idaluno = map["idaluno"];
    nomealuno = map["nomealuno"];
    datanasc = map["datanasc"];
    emailaluno = map["emailaluno"];
    senhaaluno = map["senhaaluno"];
  }

  @override
  String toString() {
    return 'Aluno(idaluno: $idaluno,nomealuno: $nomealuno, datanasc: $datanasc, emailaluno: $emailaluno, senhaaluno: $senhaaluno)';
  }
}

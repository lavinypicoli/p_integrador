class Aluno {
  String nomealuno;
  String datanasc;
  String emailaluno;
  String senhaaluno;

  Aluno(Map<String, dynamic> map) {
    nomealuno = map["nomealuno"];
    datanasc = map["datanasc"];
    emailaluno = map["emailaluno"];
    senhaaluno = map["senhaaluno"];
  }

  @override
  String toString() {
    return 'Aluno(nomealuno: $nomealuno, datanasc: $datanasc, emailaluno: $emailaluno, senhaaluno: $senhaaluno)';
  }
}

class Atividade {
  String nomeativ;
  String diaativ;
  String horaativ;
  String descricaoativ;

  Atividade(Map<String, dynamic> map) {
    nomeativ = map["nomeativ"];
    diaativ = map["diaativ"];
    horaativ = map["horaativ"];
    descricaoativ = map["descricaoativ"];
  }

  @override
  String toString() {
    return 'Atividade(nomeativ: $nomeativ, diaativ: $diaativ, horaativ: $horaativ, descricaoativ: $descricaoativ)';
  }
}

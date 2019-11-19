class Aviso {
  String textoaviso;
  String dataaviso;
  String horaaviso;

  Aviso(Map<String, dynamic> map) {
    textoaviso = map["textoaviso"];
    dataaviso = map["dataaviso"];
    horaaviso = map["horaaviso"];
  }

  @override
  String toString() {
    return 'Aviso(textoaviso: $textoaviso, dataaviso: $dataaviso, horaaviso: $horaaviso)';
  }
}

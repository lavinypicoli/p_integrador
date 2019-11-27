class Aviso {
  int idaviso;
  String textoaviso;
  String dataaviso;
  String horaaviso;


  Aviso(this.idaviso, this.textoaviso, this.dataaviso, this.horaaviso);

  Aviso.fromJson(Map<String, dynamic> json) {
    idaviso = json["idaviso"];
    textoaviso = json["textoaviso"];
    dataaviso = json["dataaviso"];
    horaaviso = json["horaaviso"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idaviso'] = this.idaviso;
    data['textoaviso'] = this.textoaviso;
    data['dataaviso'] = this.dataaviso;
    data['horaaviso'] = this.horaaviso;
    return data;
  }
}

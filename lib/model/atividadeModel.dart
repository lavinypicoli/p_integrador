
class Atividade {
  int idativ;
  String nomeativ;
  String diaativ;
  String horaativ;
  String descricaoativ;


  Atividade(
      {this.idativ, this.nomeativ, this.diaativ, this.horaativ, this.descricaoativ});

  Atividade.fromJson(Map<String, dynamic> json){
    idativ = json["idativ"];
    nomeativ = json["nomeativ"];
    diaativ = json["diaativ"];
    horaativ = json["horaativ"];
    descricaoativ = json["descricaoativ"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idativ'] = this.idativ;
    data['nomeativ'] = this.nomeativ;
    data['diaativ'] = this.diaativ;
    data['horaativ'] = this.horaativ;
    data['descricaoativ'] = this.descricaoativ;
    return data;
  }


}




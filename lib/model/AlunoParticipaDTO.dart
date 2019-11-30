class AlunoParticipaDTO {
  int idalunop;
  int idativp;

  AlunoParticipaDTO(this.idalunop, this.idativp);

  AlunoParticipaDTO.fromJson(Map<String, dynamic> json) {
    idalunop = json["idalunop"];
    idativp = json["idativp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idalunop'] = this.idalunop;
    data['idativp'] = this.idativp;

    return data;
  }
}

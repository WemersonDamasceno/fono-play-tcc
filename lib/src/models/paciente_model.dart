class PacienteModel {
  String? nomeCrianca;
  String? dataNascimento;
  String? possuiAlgumSintoma;
  String? avatarCrianca;

  PacienteModel({
    required this.nomeCrianca,
    required this.dataNascimento,
    required this.possuiAlgumSintoma,
    required this.avatarCrianca,
  });

  PacienteModel.fromJson(Map<String, dynamic> json) {
    nomeCrianca = json['nomeCrianca'];
    dataNascimento = json['dataNascimento'];
    possuiAlgumSintoma = json['possuiAlgumSintoma'];
    avatarCrianca = json['avatarCrianca'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomeCrianca'] = nomeCrianca;
    data['dataNascimento'] = dataNascimento;
    data['possuiAlgumSintoma'] = possuiAlgumSintoma;
    data['avatarCrianca'] = avatarCrianca;
    return data;
  }
}

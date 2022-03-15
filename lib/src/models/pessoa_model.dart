class PessoaModel {
  String? idPessoa;
  String? nomePessoa;
  String? emailPessoa;

  PessoaModel({
    required this.idPessoa,
    required this.nomePessoa,
    required this.emailPessoa,
  });

  PessoaModel.fromJson(Map<String, dynamic> json) {
    idPessoa = json['idPessoa'];
    nomePessoa = json['nomePessoa'];
    emailPessoa = json['emailPessoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPessoa'] = idPessoa;
    data['nomePessoa'] = nomePessoa;
    data['emailPessoa'] = emailPessoa;
    return data;
  }
}

import 'package:fonoplay/src/models/paciente_model.dart';
import 'package:fonoplay/src/models/pessoa_model.dart';

class ResponsavelModel extends PessoaModel {
  final PacienteModel crianca;

  ResponsavelModel({required this.crianca})
      : super(idPessoa: '', emailPessoa: '', nomePessoa: '');
}

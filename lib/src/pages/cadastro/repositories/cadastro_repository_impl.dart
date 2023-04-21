import 'package:cloud_firestore/cloud_firestore.dart';

import 'cadastro_repository.dart';

class CadastroRepositoryImpl extends CadastroRepository {
  final db = FirebaseFirestore.instance
      .collection("DadosCliente")
      .doc("DívidasCliente")
      .collection("Dívidas");

  @override
  void saveDividas(Map<String, dynamic> divida) {
    db.add(divida);
  }
}

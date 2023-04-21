import 'package:cloud_firestore/cloud_firestore.dart';

import 'cadastro_repository.dart';

class CadastroRepositoryImpl extends CadastroRepository {
  final db = FirebaseFirestore.instance.collection("DadosCliente");

  @override
  Future getDividas() async {
    return (await db.get())
        .docs
        .map((e) => {
              "TítuloDívida": e.get('TítuloDívida'),
              "DataCompra": e.get('DataCompra'),
              "Valor": e.get('Valor'),
              "Observações": e.get('Observações')
            })
        .toList();
  }

  @override
  void saveDividas(Map<String, dynamic> divida) {
    db.add(divida);
  }
}

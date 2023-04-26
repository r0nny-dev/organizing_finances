import 'package:cloud_firestore/cloud_firestore.dart';

import 'divida_repository.dart';

class DividaRepositoryImpl extends DividaRepository {
  final db = FirebaseFirestore.instance.collection("DadosCliente");

  @override
  Future<List<Map>> getDividas() async {
    return (await db.doc("DívidasCliente").collection("Dívidas").get())
        .docs
        .map((e) => {
              "TítuloDívida": e.get('TítuloDívida'),
              "DataVencimento": e.get('DataVencimento'),
              "Valor": e.get('Valor'),
              "Observações": e.get('Observações')
            })
        .toList();
  }
}

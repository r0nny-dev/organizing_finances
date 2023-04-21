import 'package:cloud_firestore/cloud_firestore.dart';

import 'divida_repository.dart';

class DividaRepositoryImpl extends DividaRepository {
  final db = FirebaseFirestore.instance.collection("DadosCliente");

  @override
  Future<List<Map>> getDividas() async {
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizing_finances/src/pages/home/repositories/saldo_widget_repository.dart';

class SaldoWidgetRepositoryImpl extends SaldoWidgetRepository {
  final db = FirebaseFirestore.instance.collection("DadosCliente");
  double saldo = 0;

  @override
  Future getSaldoDevedor() async {
    List<Map<String, dynamic>> dividas =
        (await db.doc("DívidasCliente").collection("Dívidas").get())
            .docs
            .map((e) => {"ValorDívida": e.get('Valor')})
            .toList();

    for (var valor in dividas) {
      saldo += valor["ValorDívida"];
    }

    final Map<String, dynamic> saldoDevedor = <String, dynamic>{"Valor": saldo};

    return saldoDevedor;
  }
}

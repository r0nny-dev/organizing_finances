import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizing_finances/src/pages/home/repositories/saldo_widget_repository.dart';

class SaldoWidgetRepositoryImpl extends SaldoWidgetRepository {
  final db = FirebaseFirestore.instance.collection("DadosCliente");

  @override
  Future getSaldoDevedor() async {
    return (await db
            .doc("DívidasCliente")
            .collection("SaldoDevedor")
            .doc("Saldo")
            .get())
        .data();
  }
}

import 'package:organizing_finances/src/pages/home/controllers/saldo_widget_controller.dart';
import 'package:organizing_finances/src/pages/home/repositories/saldo_widget_repository_impl.dart';

class SaldoWidgetControllerImpl extends SaldoWidgetController {
  @override
  Future getSaldoDevedor() {
    return SaldoWidgetRepositoryImpl().getSaldoDevedor();
  }
}

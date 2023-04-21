import 'package:organizing_finances/src/pages/divida/repositories/divida_repository_impl.dart';

import 'divida_controller.dart';

class DividaControllerImpl extends DividaController {
  @override
  Future<List<Map>> getDividas() {
    return DividaRepositoryImpl().getDividas();
  }
}

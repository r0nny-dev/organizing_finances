import '../repositories/cadastro_repository_impl.dart';
import 'cadastro_controller.dart';

class CadastroControllerImpl extends CadastroController {
  @override
  void saveDividas(Map<String, dynamic> divida) {
    final repository = CadastroRepositoryImpl();
    repository.saveDividas(divida);
  }
}

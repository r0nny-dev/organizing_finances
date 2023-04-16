import 'package:flutter/material.dart';
import '../../cadastro/cadastro_page.dart';

class CadastroButtonWidget extends StatefulWidget {
  const CadastroButtonWidget({super.key});

  @override
  State<CadastroButtonWidget> createState() => _CadastroButtonWidgetState();
}

class _CadastroButtonWidgetState extends State<CadastroButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(231, 101, 8, 0.9)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CadastroPage(),
            ));
      },
      child: const Text(
        'Cadastrar Nova Dívida',
        style: TextStyle(
          fontFamily: 'Dongle',
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

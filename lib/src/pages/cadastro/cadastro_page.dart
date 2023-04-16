import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'cadastrar dívidas',
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(231, 101, 8, 10),
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: const Color.fromRGBO(231, 101, 8, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Títilo da dívida'),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 46),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Data da compra'),
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 46),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Valor'),
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 46),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Observações (opcional)'),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 46),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

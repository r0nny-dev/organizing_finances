import 'package:flutter/material.dart';
import 'package:organizing_finances/src/shared/widget/button_widget.dart';

class DetalheDividaPage extends StatefulWidget {
  const DetalheDividaPage({super.key, required this.detalhesDivida});

  final Map? detalhesDivida;

  @override
  State<DetalheDividaPage> createState() => _DetalheDividaPageState();
}

class _DetalheDividaPageState extends State<DetalheDividaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detalhes Dívida',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 40,
                child: SizedBox(
                  height: 250,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.detalhesDivida?['TítuloDívida'],
                        style: const TextStyle(
                          fontFamily: 'Dongle',
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'R\$ ${widget.detalhesDivida?['Valor']}',
                        style: const TextStyle(
                          // fontFamily: 'Dongle',
                          fontSize: 36,
                          // fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(231, 101, 8, 10),
                        ),
                      ),
                      Text(
                        widget.detalhesDivida?['Observações'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Dongle',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(title: 'Alterar Dívida', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

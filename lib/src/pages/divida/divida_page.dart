import 'package:flutter/material.dart';

class DividaPage extends StatefulWidget {
  const DividaPage({super.key});

  @override
  State<DividaPage> createState() => _DividaPageState();
}

class _DividaPageState extends State<DividaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'dívidas acumuladas',
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
    );
  }
}

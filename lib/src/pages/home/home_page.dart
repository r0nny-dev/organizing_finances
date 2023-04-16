import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/home/widget/cadastro_button_widget.dart';
import 'package:organizing_finances/src/pages/home/widget/menu_widget.dart';
import 'package:organizing_finances/src/pages/home/widget/propaganda_widget.dart';
import 'package:organizing_finances/src/pages/home/widget/saldo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'organizing finances',
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(231, 101, 8, 10),
          ),
        ),
        backgroundColor: Colors.black,
        actions: const [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(231, 101, 8, 10),
            child: Text('R',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25)),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: const [
              SaldoWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
                child: MenuWidget(),
              ),
              PropagandaWidget(),
              Padding(
                padding: EdgeInsets.only(top: 225),
                child: CadastroButtonWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

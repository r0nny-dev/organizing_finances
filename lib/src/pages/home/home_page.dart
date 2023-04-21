import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/divida/divida_page.dart';
import 'package:organizing_finances/src/pages/home/widget/action_menu_item.dart';
import 'package:organizing_finances/src/pages/home/widget/cadastro_button_widget.dart';
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
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 25))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                SaldoWidget(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DividaPage(),
                            ),
                          );
                        },
                        child: const ActionMenuItem(
                          title: 'Dívidas',
                          icon: Icons.request_quote_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const ActionMenuItem(
                          title: 'Vecimentos',
                          icon: Icons.notification_add_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const ActionMenuItem(
                          title: 'Relatórios',
                          icon: Icons.print_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                const PropagandaWidget(),
                const Padding(
                  padding: EdgeInsets.only(top: 225),
                  child: CadastroButtonWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/divida/controllers/divida_controller_impl.dart';

class DividaPage extends StatefulWidget {
  const DividaPage({super.key});

  @override
  State<DividaPage> createState() => _DividaPageState();
}

class _DividaPageState extends State<DividaPage> {
  final controller = DividaControllerImpl();

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
      body: FutureBuilder<List<Map>>(
        future: controller.getDividas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Erro ao Carregar as Dívidas acumuladas');
          } else if (snapshot.hasData) {
            final list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(list?[index]['TítuloDívida']),
                subtitle: Text('R\$ ${(list?[index]['Valor']).toString()}'),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        color: const Color.fromRGBO(231, 101, 8, 10),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {},
                        color: const Color.fromRGBO(231, 101, 8, 10),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/detalhe_divida/detalhe_divida_page.dart';
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetalheDividaPage(detalhesDivida: list?[index]),
                    ),
                  );
                }, //OnTap Abrir Details
                leading: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(217, 217, 217, 46),
                  child: Icon(Icons.payments),
                ),
                title: Text(
                  list?[index]['TítuloDívida'],
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'R\$ ${(list?[index]['Valor']).toString()}',
                  style: const TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(231, 101, 8, 10),
                  ),
                ),
                trailing: SizedBox(
                  width: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Data de Vencimento',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '${list?[index]['DataVencimento']}',
                        style: const TextStyle(
                          fontFamily: 'Dongle',
                          fontSize: 24,
                        ),
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

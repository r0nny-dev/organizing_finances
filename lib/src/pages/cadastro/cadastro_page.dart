import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/cadastro/controllers/cadastro_controller_impl.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formkey = GlobalKey<FormState>();

  final _dataController = TextEditingController();
  final _valorController = TextEditingController();
  final _tituloController = TextEditingController();
  final _observacoesController = TextEditingController();

  saveDivida() {
    final controller = CadastroControllerImpl();

    final divida = <String, dynamic>{
      "TítuloDívida": _tituloController.text,
      "DataCompra": _dataController.text,
      "Valor": _valorController.text,
      "Observações": _observacoesController
    };

    final divida2 = <String, dynamic>{
      "TítuloDívida": _tituloController.text,
      "DataCompra": (DateTime.now()).toString(),
      "Valor": _valorController.text,
      "Observações": _observacoesController.text
    };

    controller.saveDividas(divida2);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Títilo da dívida'),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 46),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Defina um Título';
                          }

                          return null;
                        },
                        controller: _tituloController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Defina uma data';
                                  }

                                  return null;
                                },
                                controller: _dataController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Icon(Icons.calendar_month_outlined),
                                  ),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Defina um Valor';
                                  }

                                  return null;
                                },
                                controller: _valorController,
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
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 46),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Defina uma Observação';
                          }

                          return null;
                        },
                        controller: _observacoesController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 275,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(231, 101, 8, 0.9)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    saveDivida();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Dívida Salva Com Sucesso'),
                      backgroundColor: Colors.greenAccent,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Falha ao salvar nova dívida'),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                child: const Text(
                  'Salvar dívida',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

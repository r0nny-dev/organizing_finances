import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizing_finances/src/shared/widget/button_widget.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:organizing_finances/src/pages/cadastro/widget/form_field_widget.dart';
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

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dataController.text =
              "${value.day}-${(value.month < 10) ? ('0${value.month}') : value.month}-${value.year}";
        });
      }
    });
  }

  String _snackBar(String message, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: cor,
      ),
    );
    return message;
  }

  saveDivida() {
    final controller = CadastroControllerImpl();
    String valorCompleto = _valorController.text
        .substring(4)
        .replaceAll('.', '')
        .replaceAll(',', '.');

    final divida = <String, dynamic>{
      "TítuloDívida": _tituloController.text,
      "DataVencimento": _dataController.text,
      "Valor": double.parse(valorCompleto),
      "Observações": _observacoesController.text
    };

    controller.saveDividas(divida);
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
                    FormFieldWidget(
                      controller: _tituloController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _snackBar(
                            'Defina um Título',
                            Colors.redAccent,
                          );
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Data Vencimento'),
                            FormFieldWidget(
                              width: 175,
                              onTap: _showDatePicker,
                              controller: _dataController,
                              keyboard: TextInputType.none,
                              icon: const Icon(Icons.calendar_month_outlined),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return _snackBar(
                                    'Defina a data de Vencimento',
                                    Colors.redAccent,
                                  );
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Valor'),
                            FormFieldWidget(
                              width: 175,
                              controller: _valorController,
                              keyboard: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                CurrencyTextInputFormatter(
                                  locale: 'pt-br',
                                  decimalDigits: 2,
                                ),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return _snackBar(
                                    'Defina um Valor',
                                    Colors.redAccent,
                                  );
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Observações (opcional)'),
                    FormFieldWidget(
                      controller: _observacoesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _snackBar(
                            'Defina uma Observação',
                            Colors.redAccent,
                          );
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 275,
                    ),
                    ButtonWidget(
                      title: 'Salvar dívida',
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          saveDivida();

                          _snackBar(
                              'Dívida Salva Com Sucesso', Colors.greenAccent);

                          Navigator.pop(context);
                        } else {
                          _snackBar(
                              'Falha ao salvar nova dívida', Colors.redAccent);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

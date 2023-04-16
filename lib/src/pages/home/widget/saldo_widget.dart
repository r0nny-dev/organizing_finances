import 'package:flutter/material.dart';

class SaldoWidget extends StatefulWidget {
  const SaldoWidget({super.key});

  @override
  State<SaldoWidget> createState() => _SaldoWidgetState();
}

class _SaldoWidgetState extends State<SaldoWidget> {
  final double _saldoDevedor = 2800.25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 25, 4),
          child: Row(
            children: const [
              Text('SALDO DEVEDOR'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'R\$ $_saldoDevedor',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(231, 101, 8, 10),
                ),
              ),
              const Icon(Icons.remove_red_eye_outlined, size: 28),
            ],
          ),
        ),
        const Divider(height: 10),
      ],
    );
  }
}

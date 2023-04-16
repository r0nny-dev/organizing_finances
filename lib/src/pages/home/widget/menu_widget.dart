import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 110,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromRGBO(217, 217, 217, 46),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.request_quote_outlined,
                size: 32,
              ),
              Text('Dívidas'),
            ],
          ),
        ),
        Container(
          width: 110,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromRGBO(217, 217, 217, 46),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.notification_add_outlined,
                size: 32,
              ),
              Text('Vencimento'),
            ],
          ),
        ),
        Container(
          width: 110,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromRGBO(217, 217, 217, 46),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.print_outlined,
                size: 32,
              ),
              Text('Relatório'),
            ],
          ),
        ),
      ],
    );
  }
}

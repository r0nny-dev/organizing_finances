import 'package:flutter/material.dart';

class ActionMenuItem extends StatefulWidget {
  const ActionMenuItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  State<ActionMenuItem> createState() => _ActionMenuItemState();
}

class _ActionMenuItemState extends State<ActionMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromRGBO(217, 217, 217, 46),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(widget.icon, size: 32),
          Text(widget.title),
        ],
      ),
    );
  }
}

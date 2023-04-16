import 'package:flutter/widgets.dart';

class PropagandaWidget extends StatefulWidget {
  const PropagandaWidget({super.key});

  @override
  State<PropagandaWidget> createState() => _PropagandaWidgetState();
}

class _PropagandaWidgetState extends State<PropagandaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromRGBO(217, 217, 217, 46),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          'images/card_propaganda.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

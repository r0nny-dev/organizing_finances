import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    super.key,
    this.icon,
    this.width,
    this.inputFormatters,
    this.onTap,
    this.keyboard,
    required this.validator,
    required this.controller,
  });

  final Icon? icon;
  final double? width;
  final Function()? onTap;
  final TextInputType? keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 5),
      width: widget.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 46),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: widget.icon,
          prefixStyle: const TextStyle(),
        ),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboard,
      ),
    );
  }
}

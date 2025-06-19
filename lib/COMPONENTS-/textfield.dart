import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travon/THEMES/style.dart';

class BasicTextfield extends StatelessWidget {
  final bool digitsOnly;
  final double width;
  final bool readonly;
  final String? text;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData? icon;
  const BasicTextfield({super.key, required this.digitsOnly, required this.width, required this.readonly, this.text, required this.controller, this.validator, this.icon});
  // FilteringTextInputFormatter digitsOnly = FilteringTextInputFormatter.digitsOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        inputFormatters: digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
        readOnly: readonly,
        style: const TextStyle(fontSize: Primary_font_size.Text7, color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Primary_colors.Dark,
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),

          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          // labelText: text,
          label: Text(text ?? ''),
          labelStyle: const TextStyle(fontSize: Primary_font_size.Text7, color: Color.fromARGB(255, 167, 165, 165)),
          border: const OutlineInputBorder(),

          prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        ),
        validator: validator,
      ),
    );
  }
}

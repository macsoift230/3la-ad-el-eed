import 'package:flutter/material.dart';

class CustFormField extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  TextEditingController controller ;

  CustFormField({
    super.key,
    this.color,
    this.borderColor,
    required this.controller,
    required this.hint,
    this.validator,
    this.onSaved,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: borderColor,
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintStyle: TextStyle(fontSize: 20),
            hintText: hint,
            contentPadding: EdgeInsets.only(left: 20),
            filled: true,
            fillColor: color,
          ),
          validator: validator,
        ),
      ),
    );
  }
}

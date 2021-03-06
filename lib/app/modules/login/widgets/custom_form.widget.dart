import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final sufix;
  final prefix;
  final hint;
  final obscure;
  final enabled;
  final onChanged;
  final type;

  const CustomForm({
    @required this.sufix,
    @required this.prefix,
    @required this.hint,
    @required this.obscure,
    @required this.enabled,
    @required this.onChanged,
    @required this.type,
  });
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: sh * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(1, 1),
              spreadRadius: 1,
            ),
          ],
          color: Colors.white),
      //width: MediaQuery.of(context).size.width,
      height: sh * 0.07,
      width: double.maxFinite,
      child: Center(
        child: TextFormField(
          keyboardType: type,
          onChanged: onChanged,
          obscureText: obscure,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            enabled: enabled,
            hintText: hint,
            border: InputBorder.none,
            suffixIcon: sufix,
            prefixIcon: prefix,
          ),
          style: TextStyle(fontSize: sh * 0.016),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final text;

  const BadgeWidget({
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: sw * 0.02, horizontal: sw * 0.02),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(sw * 0.02),
      ),
    );
  }
}

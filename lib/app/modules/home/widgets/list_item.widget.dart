import 'package:biodriver/app/modules/home/widgets/badge/badge_widget.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final alias;
  final number;
  final clientOnPressed;

  const ListWidget({
    @required this.alias,
    @required this.number,
    @required this.clientOnPressed,
  });
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: sh * 0.01),
      child: Container(
        height: sh * 0.1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BadgeWidget(
                  text: alias,
                ),
                SizedBox(
                  height: sh * 0.01,
                ),
                BadgeWidget(
                  text: number,
                ),
              ],
            ),
            Container(
              width: sw * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: clientOnPressed,
                    child: Text('Clientes'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

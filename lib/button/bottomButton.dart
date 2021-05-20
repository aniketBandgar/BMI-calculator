import 'package:flutter/material.dart';
import '../components/constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, this.label});

  final Function onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: Colors.red,
        height: kHeightOfBottomContainer,
        width: double.infinity,
      ),
    );
  }
}

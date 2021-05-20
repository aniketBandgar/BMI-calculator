import 'package:flutter/material.dart';
import 'constant.dart';

class Content extends StatelessWidget {
  Content({@required this.iconOnCard, this.gender});

  final IconData iconOnCard;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconOnCard,
          size: 80,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

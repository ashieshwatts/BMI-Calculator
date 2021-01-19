
import 'package:flutter/material.dart';
import '../constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.changeIcon,@required this.changeName});

  final IconData changeIcon;
  final String changeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          changeIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          changeName,
          style: kIconTextStyle,
        )
      ],
    );
  }
}
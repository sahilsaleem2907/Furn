import 'package:flutter/material.dart';

import '../size_config.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize as double;
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: defaultSize * 1.6, //16
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

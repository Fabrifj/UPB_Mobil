import 'package:flutter/material.dart';

import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage({super.key, required this.title});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 56,vertical: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: UpbTextStyle.getTextStyle("h2", ColorResourcees.p_Yellow, "b"),
      ),
    );
  }

}
import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class AboutUsPage extends StatelessWidget {
  final String title;
  AboutUsPage( this.title);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: const Center(
        child: Text("AboutUs"),
      ),);
  }
}

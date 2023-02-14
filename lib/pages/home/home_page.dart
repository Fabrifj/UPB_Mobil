import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}

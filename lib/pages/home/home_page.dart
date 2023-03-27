import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Map<String, dynamic>? userData;

  const HomePage({super.key, required this.title, required this.userData});

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

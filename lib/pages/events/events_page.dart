import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class EventsPage extends StatelessWidget {
  final String title;
  EventsPage({ super.key, required this.title}){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        child: Center(
          child: Text("Events"),
        ),
      ),);
  }
}

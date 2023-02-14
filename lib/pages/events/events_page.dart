import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:upb_mobil/routes/aplication.dart';
import '../../components/upb_scafold.dart';

class EventsPage extends StatelessWidget {
  final String title;
  EventsPage({super.key, required this.title}) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: const Text("Events"),
            ),
            TextButton(
              onPressed: () {
                Application.router.navigateTo(context, "content-management",
                    transition: TransitionType.inFromRight);
              },
              child: Text("Agregar Evento"),
            ),
          ],
        ),
      ),
    );
  }
}

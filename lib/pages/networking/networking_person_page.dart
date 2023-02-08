import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class NetworkingPersonPage extends StatelessWidget {
  final String title;
  final String idPerson;

  NetworkingPersonPage(this.title, this.idPerson){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Text("NetworkingPersonPage")
        ),
      ));
  }
}


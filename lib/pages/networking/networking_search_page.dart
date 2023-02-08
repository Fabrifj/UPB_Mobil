import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class NetworkingSearchPage extends StatelessWidget {
  final String title;
  final String idCategorie;


  NetworkingSearchPage(this.title, this.idCategorie){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: "Net",
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Text("NetworkingSearchPage")
        ),
      ));
  }
}


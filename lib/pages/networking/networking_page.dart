import 'package:flutter/material.dart';

import '../../components/lists/list_view.dart';
import '../../components/upb_scafold.dart';

class NetworkingPage extends StatelessWidget {
  final String title;
  List<Map<String, dynamic>> _titles = [
    {'id': 1, 'data': 'Liderazgo'},
    {'id': 2, 'data': 'Tencnicas'},
    {'id': 3, 'data': 'Ventas'},
    {'id': 4, 'data': 'Interpersonales'},
    {'id': 5, 'data': 'Industrial'},
    {'id': 5, 'data': 'Resolución de problemas'},
  ];

  NetworkingPage(this.title){}


  @override
  Widget build(BuildContext context) {

    var categorias = ListViewUPB(_titles, true) ;

    return UpbScaffold(
      title: title,
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: categorias
        ),
      ));
  }
}


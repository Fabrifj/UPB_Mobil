import 'package:flutter/material.dart';

import '../../components/lists/list_view.dart';
import '../../components/upb_scafold.dart';

class NetworkingCategoriesPage extends StatelessWidget {
  final String title;
  List<Map<String, dynamic>> titles = [
    {'id': 1, 'data': 'Categoria-1'},
    {'id': 2, 'data': 'Categoria-2'},
    {'id': 3, 'data': 'Categoria-3'},
    {'id': 4, 'data': 'Categoria-4'},
    {'id': 5, 'data': 'Categoria-5'},
  ];

  NetworkingCategoriesPage(this.title){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: ListViewUPB(titles)
        ),
      ));
  }
}


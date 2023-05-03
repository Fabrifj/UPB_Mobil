import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/lists/list_view.dart';
import '../../components/upb_scafold.dart';

class NetworkingSearchPage extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  final String title;
  final String idCategorie;
  List<Map<String, dynamic>> _persons = [
    {'id': 1, 'data': 'Person-1'},
    {'id': 2, 'data': 'Person-2'},
    {'id': 3, 'data': 'Person-3'},
    {'id': 4, 'data': 'Person-4'},
    {'id': 5, 'data': 'Person-5'},
  ];

  NetworkingSearchPage(this.title, this.idCategorie){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: "Networking",
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: ListViewUPB(_persons, false)
        ),
      ));
  }
}


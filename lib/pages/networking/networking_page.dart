import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/lists/list_view.dart';
import '../../components/upb_scafold.dart';

class NetworkingPage extends StatelessWidget {
  final String title;
  String listPaths = "assets/routes/data_list.json";

  NetworkingPage(this.title){}


  @override
  Widget build(BuildContext context) {

    var categorias = FutureBuilder(
        future: readJsonFile(listPaths),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> routeLists = jsonDecode(snapshot.data!);
            List<dynamic> _titlesCategories = routeLists['Categories'] as List<dynamic>;
            return ListViewUPB(_titlesCategories, true) ;
          }
          else {
            return Center(child: CircularProgressIndicator());
          }}
          );

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
  Future<String> readJsonFile(String listPaths) async {
    return await rootBundle.loadString(listPaths);
  }
}


import 'package:flutter/material.dart';

import 'list_item_nwp.dart';

class ListViewUPB extends StatelessWidget {
  final List<dynamic> jsonObjects;

  ListViewUPB(this.jsonObjects);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  ListView.builder(
          itemCount: jsonObjects.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItemNetworkingPerson(
                jsonObjects[index]['id'], jsonObjects[index]['data']);
          }
    );
  }
}

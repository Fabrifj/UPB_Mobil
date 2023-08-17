import 'package:flutter/material.dart';

import 'list_item_nwc.dart';

class ListViewUPB extends StatelessWidget {
  final List<dynamic> jsonObjects;
  final bool showItem;

  ListViewUPB(this.jsonObjects, this.showItem);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  ListView.builder(
          itemCount: jsonObjects.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItemNetworkingCat(
                jsonObjects[index]['id'], jsonObjects[index]['data']);
             }
    );
  }
}

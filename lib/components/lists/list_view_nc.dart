import 'package:flutter/material.dart';

import 'list_item_nwc.dart';
import 'list_item_nwp.dart';

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
            return showItem
            ?ListItemNetworkingCat(
                jsonObjects[index]['id'], jsonObjects[index]['data'])
            :ListItemNetworkingPerson(
                jsonObjects[index]['id'], jsonObjects[index]['data']);
          }
    );
  }
}

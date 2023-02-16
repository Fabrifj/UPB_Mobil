import 'package:flutter/material.dart';
import '../../routes/aplication.dart';
import '../../static_resources/color_resources.dart';



class ListItemNetworkingPerson extends StatelessWidget {
  final itemData;
  final itemId;

  ListItemNetworkingPerson( this.itemId, this.itemData );


  @override
  Widget build(BuildContext context) {
    final Container _personImage = Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/200"),
          fit: BoxFit.cover,
        ),)
    );
    
    final Container _personDes = Container(
      child: Column(
        children: [
          Text(itemData),
          Text('categories')
        ],
      ),
    );

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: () {
          Application.router.navigateTo(context,"/networking-search/$itemId" );
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(8),
            width: constraints.maxWidth * 0.75,
            decoration: BoxDecoration(
              color: ColorResourcees.s_Yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _personImage,
                _personDes
              ],
            )
            )
      );
    });
  }
}

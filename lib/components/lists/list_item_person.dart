import 'package:flutter/material.dart';
import '../../routes/aplication.dart';
import '../../static_resources/color_resources.dart';



class ListItemPerson extends StatelessWidget {
  final String itemData;
  final String itemId;
  final String photo;

  ListItemPerson( this.itemId, this.itemData, this.photo );


  @override
  Widget build(BuildContext context) {
    final Container _personImage = Container(
      height: 56.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/200"),
          fit: BoxFit.cover,
        ),)
    );
    
    final Container _personDes = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          print(itemId);
          Application.router.navigateTo(context,"/networking/person/$itemId" );
        },
        child: Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 48,
              top: 8,
              bottom: 8
            ),
            margin: const EdgeInsets.all(8),
            width: constraints.maxWidth * 0.75,
            decoration: BoxDecoration(
              color: ColorResourcees.s_Yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(child: _personImage, flex: 1),
                Expanded(child: _personDes, flex:  3)

              ],
            )
            )
      );
    });
  }
}

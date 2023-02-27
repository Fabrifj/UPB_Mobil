import 'package:flutter/material.dart';
import '../../routes/aplication.dart';
import '../../static_resources/color_resources.dart';
import '../../static_resources/theme_data.dart';



class ListItemNetworkingCat extends StatelessWidget {
  final itemData;
  final itemId;

  ListItemNetworkingCat(this.itemId,this.itemData );


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: () {
          Application.router.navigateTo(context,"/networking-search/$itemId" );
          // Navigator.pushNamed(context, "/networking-search/$itemId");
          print("sd");
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(8),
            width: constraints.maxWidth * 0.75,
            decoration: BoxDecoration(
              color: ColorResourcees.s_Yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
                    itemData,
                    style: UpbTextStyle.getTextStyle("h3", ColorResourcees.s_white, "l"),
                ),
              ),
            )
      );
    });
  }
}

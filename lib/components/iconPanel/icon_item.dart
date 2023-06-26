import 'package:flutter/material.dart';
import '../../Static_resources/color_resources.dart';
import '../../Static_resources/theme_data.dart';
import 'logos_model.dart';
import 'package:url_launcher/url_launcher.dart';


class Iconitem extends StatefulWidget {
  final LogoModel iconDetails;
  const Iconitem(  {required  this.iconDetails, super.key});


  @override
  _IconitemState createState()=>_IconitemState();
}


class _IconitemState extends State<Iconitem> {

  late final LogoModel iconDetails;
  bool _selectedIndex = false;

    @override
  void initState() {
    super.initState();
    iconDetails = widget.iconDetails;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  InkWell(
      onTap: () async {
        if (await canLaunch(iconDetails.link)) {
          await launch(iconDetails.link);
        } else {
          throw 'No se pudo abrir la página';
        }
      },
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _selectedIndex = true;
          });
          },
        onExit: (event) {
          setState(() {
            _selectedIndex = false;
          });
          },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white
              ),
              width: size.width * 0.24,
              height: 120,
              child: Image.asset(iconDetails.logo),

            ),
            if(_selectedIndex)
              Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:  Colors.grey.withOpacity(0.8),
              ),
              width: size.width * 0.24,
              height: 120,
                child: Center(child: Text(iconDetails.title, style: UpbTextStyle.getTextStyle("b2", ColorResourcees.p_Blue, "b"),)),
              )
          ]
        ),
      ),
    );
  }
}

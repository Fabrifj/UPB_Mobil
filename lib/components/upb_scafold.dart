import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:upb_mobil/routes/aplication.dart';
import 'package:upb_mobil/static_resources/user_provider.dart';

class UpbScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  UpbScaffold({Key? key, required this.body, required this.title})
      : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Container background = Container(
    child: Image.asset(
      '../assets/img/TextureBackground.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final uid = userProvider.user?.uid;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.blue,
          leading: GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, "persona-page/0goeVlilBvSEK1vRggBtaCi5u0D3");
            },
            child: Container(
              margin: EdgeInsets.all(4),
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Sidebar'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [body],
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.only(right: 12, left: 12),
            color: Colors.grey[300],
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.calendar_month_rounded),
                        onPressed: () {
                          Application.router.navigateTo(context, "events",
                              transition: TransitionType.inFromLeft);
                        })),
                SizedBox(width: 30),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.group),
                        onPressed: () {
                          Application.router.navigateTo(context, "networking",
                              transition: TransitionType.inFromLeft);
                        })),
                SizedBox(width: 30),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Application.router.navigateTo(context, "about-us",
                              transition: TransitionType.inFromRight);
                        }))
              ],
            )));
  }
}

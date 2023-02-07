import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
            title: Text('Example Tab Bar'),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Center(
                  child: Text('Contenido de Tab 1'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Contenido de Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Contenido de Tab 3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class PersonalInfoPage extends StatelessWidget {
  final String title;
  PersonalInfoPage(this.title) {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
        title: title,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651__340.png'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Gabriel Perez Paredes',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Interests:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 1
                      },
                      child: Text('Eventos'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 2
                      },
                      child: Text('Networking'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 3
                      },
                      child: Text('Managment'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Activities:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text('Proyectos'),
                      ),
                      ListTile(
                        leading: Icon(Icons.explore),
                        title: Text('Experiencia'),
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('Acerca de mi'),
                      ),
                      ListTile(
                        leading: Icon(Icons.currency_bitcoin_sharp),
                        title: Text('intereses'),
                      ),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Text('Experiencia laboral'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

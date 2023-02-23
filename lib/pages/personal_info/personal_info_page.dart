// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class PersonalInfoPage extends StatelessWidget {
  final String title;
  final idPerson;
  final bool canEdit;
  const PersonalInfoPage(this.title, this.idPerson,this.canEdit, {super.key});

  @override
  Widget build(BuildContext context) {
    return UpbScaffold(
        title: title,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651__340.png'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Gabriel Perez Paredes',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Interests:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 1
                      },
                      child: const Text('Eventos'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 2
                      },
                      child: const Text('Networking'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 3
                      },
                      child: const Text('Managment'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Activities:',
                  style: TextStyle(fontSize: 16.0),
                ),
                Expanded(
                  child: ListView(
                    children: const [
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

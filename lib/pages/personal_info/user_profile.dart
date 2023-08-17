
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/pages/personal_info/do_matching.dart';
import 'package:upb_mobil/pages/personal_info/matching_list.dart';
import '../../components/upb_scafold.dart';


class UserProfile extends StatefulWidget {
  final String userUid;
  final bool canEdit;
  final String title;

  UserProfile(
      {super.key, required this.userUid, required this.canEdit, required this.title});


  @override
  State<StatefulWidget> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  ElevatedButton createMatchingButton(userId, userName, myUserId){
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return widget.canEdit? MatchingPopup(userId: widget.userUid):
            DoMatching(
              title: " test ",
              userName: userName,
              userIdO:  myUserId,
              userIdD: userId,
            );
            },
        );
        },
      child: Text('Mostrar popup'),
    );
  }
  @override
  Widget build(BuildContext context) {

      print(widget.userUid);
      return UpbScaffold(
        title: widget.title,
        body:SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: _firestore.collection('users').doc(widget.userUid).get(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(child: Text('Error al cargar datos'));
              }
              final userData = snapshot.data!;
              return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: createMatchingButton(widget.userUid,(userData.get("name")+userData.get("lastName")), "test")
                ),
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(""),
                ),
                const SizedBox(height: 16.0),
                Text(userData.get("name"),style: const TextStyle(fontSize: 20.0),textAlign: TextAlign.center),
                Text(userData.get("lastName"),style: const TextStyle(fontSize: 20.0),textAlign: TextAlign.center),
                const SizedBox(height: 8.0),
                Text(userData.get("resume"),style: const TextStyle(fontSize: 16.0),textAlign: TextAlign.center),
                // const SizedBox(height: 16.0),
                // Text(userData.get("interest"),style: const TextStyle(fontSize: 16.0),textAlign: TextAlign.center),
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
                Column(
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
              ],
            );
          } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
          )
        )
    );
  }
}

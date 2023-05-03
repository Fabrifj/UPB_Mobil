import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/static_resources/color_resources.dart';

class MatchingPopup extends StatefulWidget {
  final String userId;

  MatchingPopup({required this.userId});

  @override
  _MatchingPopupState createState() => _MatchingPopupState();
}

class _MatchingPopupState extends State<MatchingPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Matchings'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: ColorResourcees.p_Blue,
                tabs: [
                  Tab(text: 'Pendientes'),
                  Tab(text: 'Aceptados'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildPendingTab(),
                    _buildAcceptedTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }

  Widget _buildPendingTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('matching')
          .where('user_id_destini', isEqualTo: widget.userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error al cargar datos'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final matching = snapshot.data!.docs[index];
            final userName = matching.get('user_name');
            final message = matching.get('message');
            final docId = matching.id;
            final match = matching.get('match');

            if (match == null) {
              return ListTile(
                title: Text(userName),
                subtitle: Text(message),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('matching')
                            .doc(docId)
                            .update({'match': true});
                      },
                      icon: Icon(Icons.check),
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('matching')
                            .doc(docId)
                            .update({'match': false});
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  Widget _buildAcceptedTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('matching')
          .where('user_id_destini', isEqualTo: widget.userId)
          .where('match', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error al cargar datos'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final matching = snapshot.data!.docs[index];
            final userName = matching.get('user_name');
            final message = matching.get('message');

            return ListTile(
              title: Text(userName),
              subtitle: Text(message),
            );
          },
        );
      },
    );
  }
}

// Future<void> showMatchingPopup(BuildContext context, String userId) async {
//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return MatchingPopup3(userId: userId);
//     },
//   );
// }


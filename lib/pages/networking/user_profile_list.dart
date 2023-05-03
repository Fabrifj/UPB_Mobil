import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/components/lists/list_item_person.dart';
import 'package:upb_mobil/components/upb_scafold.dart';

import '../../upb_classes/upb_clasees.dart';

class UserProfileList extends StatefulWidget {
  final String networkingTitle;
  final String category;
  UserProfileList(this.networkingTitle, this.category);

  @override
  _UserProfileListState createState() => _UserProfileListState();
}

class _UserProfileListState extends State<UserProfileList> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return UpbScaffold(
      title:widget.networkingTitle,
      body: Column(
        children: [
          Text("Lista de usuarios"),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error al cargar datos'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final users = snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return UserProfileC(
                    id: doc.id,
                    name: data['name'],
                    lastName: data['lastName'],
                    photo: data['photo'],
                    resume: data['resume'],
                    interests: List<String>.from(data['interests']),
                  );
                }).toList();

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final userProfile = users[index];
                    return ListItemPerson(
                        userProfile.id,
                        (userProfile.name+" "+userProfile.lastName),
                        userProfile.photo
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

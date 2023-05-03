import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/upb_scafold.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EventsPage extends StatelessWidget {
  final String title;
  final _firestore = FirebaseFirestore.instance;

  EventsPage({super.key, required this.title}) {}

  @override
  Widget build(BuildContext context) {
    return UpbScaffold(
      title: title,
      body: Center(
        child: FutureBuilder(
          future: _firestore.collection("programs").get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error al cargar los datos');
              }
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final data = snapshot.data!;
              var programsList = data.docs
                  .map((doc) => {
                        "id": doc.id,
                        "image": doc.data()["image"],
                        "title": doc.data()["title"]
                      })
                  .toList();
              return ListView.builder(
                itemCount: programsList.length,
                itemBuilder: (context, index) {
                  final element = programsList[index];
                  return GestureDetector(
                    onTap: () {
                      print(element["id"]);
                    },
                    child: ListTile(
                      leading: FutureBuilder<String>(
                        future: getImageUrl(element["image"]),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Image.network(snapshot.data!);
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      title: Text(element["title"]),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> getImageUrl(String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    final url = await ref.getDownloadURL();
    return url;
  }
}

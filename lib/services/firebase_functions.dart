// import 'package:cloud_firestore/cloud_firestore.dart';
//
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
// class FirebaseFunctions {
//   Future<List<Map<String, dynamic>>> getAllByCollection(String collectionName) async {
//     List<Map<String,dynamic>> NewsList = [];
//     _firestore.collection(collectionName)
//       (snapshot) {
//       var data = snapshot.data?.docs;
//       data?.forEach((element) {
//         NewsList.add(element);
//       });
//     }
//     return NewsList;
//   }
//
//   Future<void> pushByCollection(String collectionName, String dataToPush) async {
//
//   }
// }

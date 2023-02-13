// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:path/path.dart' as Path;

// import '../../Components/upb_scaffold.dart';

// class ManagementContent extends StatefulWidget {
//   @override
//   _ManagementContentState createState() => _ManagementContentState();
// }

// class _ManagementContentState extends State<ManagementContent> {
//   Uint8List webImage = Uint8List(8);
//   File? _pickedImage;
//   PickedFile? _imageToUpload;
//   String imagePath = "";
//   String imagePathForFirebase = "";

//   String _newsAuthor = "";
//   String _newsDescription = "";
//   String _newsImage = '';
//   String _newsTitle = "";
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final _formKey = GlobalKey<FormState>();

//     Future<void> _pickImage() async {
//       if (!kIsWeb) {
//         final ImagePicker _picker = ImagePicker();
//         PickedFile? image = await ImagePicker().getImage(
//           source: ImageSource.gallery,
//         );
//         if (image != null) {
//           var selected = File(image.path);
//           setState(() {
//             _pickedImage = selected;
//             _imageToUpload = image;
//           });
//         } else {
//           print('No image has been picked.');
//         }
//       } else if (kIsWeb) {
//         final ImagePicker _picker = ImagePicker();
//         PickedFile? image = await ImagePicker().getImage(
//           source: ImageSource.gallery,
//         );
//         if (image != null) {
//           setState(() {
//             _imageToUpload = image;
//             imagePath = _imageToUpload!.path;
//             print(imagePath);
//           });
//         } else {
//           print('No image has been picked.');
//         }
//       } else {
//         print('Something went wrong.');
//       }
//     }

//     Future<void> uploadImage(PickedFile? image) async {
//       final FirebaseStorage storage = FirebaseStorage.instance;
//       String key = _newsTitle + _newsAuthor;
//       imagePathForFirebase =
//           "images/news/${key}${Path.basename(_imageToUpload!.path)}${DateTime.now().millisecondsSinceEpoch}";
//       final storageRef = storage.ref().child(imagePathForFirebase);
//       await storageRef.putData(await _imageToUpload!.readAsBytes(),
//           SettableMetadata(contentType: 'image/jpeg'));
//     }

//     Widget dottedBorderImageUploader({
//       required Color color,
//     }) {
//       return Padding(
//         padding: const EdgeInsets.all(8),
//         child: DottedBorder(
//           dashPattern: const [6.7],
//           borderType: BorderType.RRect,
//           radius: const Radius.circular(10),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.image_outlined,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }

//     return UpbScaffold(
//       body: Form(
//         key: _formKey,
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'News Title'),
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) => _newsTitle = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'News Author'),
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter an author';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) => _newsAuthor = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Description'),
//                 maxLines: 5,
//                 keyboardType: TextInputType.multiline,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter description';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) => _newsDescription = value,
//               ),
//               Container(
//                 width: size.width * 0.3,
//                 height: size.height * 0.3,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: _pickedImage == null
//                     ? dottedBorderImageUploader(color: Colors.black)
//                     : kIsWeb
//                         ? Expanded(
//                             child: Image.file(
//                               File(_imageToUpload!.path),
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : Expanded(
//                             child: Image.file(
//                               _pickedImage!,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           ),
//               ),
//               TextButton(
//                 onPressed: (() {
//                   _pickImage();
//                 }),
//                 child: const Text('Choose Image'),
//               ),
//               Text('path: ' +
//                   imagePath), // para confirmar que estamos subiendo una imagen, ya que la imagen no se despliega (por ahora)
//               Container(
//                 margin: EdgeInsets.only(top: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_newsTitle.length > 2 &&
//                         _newsAuthor.length > 1 &&
//                         _newsDescription.length > 3) {
//                       if (kIsWeb) {
//                         uploadImage(_imageToUpload);
//                       } else {
//                         uploadImage(_imageToUpload);
//                       }
//                       FirebaseFirestore.instance.collection("news").add({
//                         "newsTitle": _newsTitle,
//                         "newsAuthor": _newsAuthor,
//                         "newsDescription": _newsDescription,
//                         "newsImage": imagePathForFirebase
//                       });
//                       Navigator.pop(context);
//                     } else {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text('Error'),
//                             content: Text('Llenar los espacios correctamente.'),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: Text('OK'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }
//                   },
//                   child: const Text("Submit"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoMatching extends StatefulWidget {
  final String title;
  final String userName;
  final String userIdO;
  final String userIdD;

  DoMatching({required this.title, required this.userName, required this.userIdD, required this.userIdO});

  @override
  _DoMatchingState createState() => _DoMatchingState();
}

class _DoMatchingState extends State<DoMatching> {
  final _firestore = FirebaseFirestore.instance;
  final _textFieldController = TextEditingController();

  Future<void> _sendDataToFirestore() async {
    await _firestore.collection('matching').add({
      'user_id_origin': widget.userIdO,
      'user_id_destini': widget.userIdD,
      'user_name': widget.userName,
      'message': _textFieldController.text,
      'match': null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Nombre: ${widget.userName}\nID: ${widget.userIdO}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: 'Ingrese su mensaje',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _sendDataToFirestore();
                      Navigator.pop(context);
                    },
                    child: Text('Enviar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

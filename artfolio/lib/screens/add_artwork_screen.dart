import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddArtworkScreen extends StatefulWidget {
  @override
  _AddArtworkScreenState createState() => _AddArtworkScreenState();
}

class _AddArtworkScreenState extends State<AddArtworkScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  void _submit() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final imageUrl = _imageUrlController.text;

    if (title.isEmpty || description.isEmpty || imageUrl.isEmpty) {
      return;
    }

    FirebaseFirestore.instance.collection('artworks').add({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Artwork')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Add Artwork'),
            ),
          ],
        ),
      ),
    );
  }
}

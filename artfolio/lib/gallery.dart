import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Container(
        color: Colors.blue[50],
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('art').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            var artDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: artDocs.length,
              itemBuilder: (context, index) {
                var art = artDocs[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.network(
                          art['artImage'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                art['artistName'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                art['title'], // Assuming there is a 'title' field in the art collection
                                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/artDetail',
                              arguments: art,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SubmitArtDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SubmitArtDialog extends StatefulWidget {
  @override
  _SubmitArtDialogState createState() => _SubmitArtDialogState();
}

class _SubmitArtDialogState extends State<SubmitArtDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Submit Your Art'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Your Name'),
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(hintText: 'Art Title'),
          ),
          TextField(
            controller: _imageLinkController,
            decoration: InputDecoration(hintText: 'Image Link'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty &&
                _titleController.text.isNotEmpty &&
                _imageLinkController.text.isNotEmpty) {
              FirebaseFirestore.instance.collection('art').add({
                'artistName': _nameController.text,
                'title': _titleController.text,
                'artImage': _imageLinkController.text,
              });
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

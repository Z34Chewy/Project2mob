import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtDetailScreen extends StatelessWidget {
  final DocumentSnapshot art;

  ArtDetailScreen({required this.art});

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(art['title'])),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(art['artImage']),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Artist: ${art['artistName']}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('art')
                        .doc(art.id)
                        .collection('feedback')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var feedbackDocs = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: feedbackDocs.length,
                        itemBuilder: (context, index) {
                          var feedback = feedbackDocs[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.feedback, color: Colors.blue),
                              title: Text(
                                feedback['feedback'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: feedbackController,
                    decoration: InputDecoration(hintText: 'Add Feedback'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (feedbackController.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection('art')
                          .doc(art.id)
                          .collection('feedback')
                          .add({'feedback': feedbackController.text});
                      feedbackController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

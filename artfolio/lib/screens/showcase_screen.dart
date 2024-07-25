import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/artwork.dart';

class ShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Showcase Artworks')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('artworks').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No artworks added yet.'));
          }

          final artworks = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Artwork(
              title: data['title'] ?? '',
              description: data['description'] ?? '',
              imageUrl: data['imageUrl'] ?? '',
            );
          }).toList();

          return ListView.builder(
            itemCount: artworks.length,
            itemBuilder: (ctx, index) {
              final artwork = artworks[index];
              return ListTile(
                leading: artwork.imageUrl.isNotEmpty
                    ? Image.network(
                        artwork.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(width: 50, height: 50), // Placeholder if no image
                title: Text(artwork.title),
                subtitle: Text(artwork.description),
              );
            },
          );
        },
      ),
    );
  }
}

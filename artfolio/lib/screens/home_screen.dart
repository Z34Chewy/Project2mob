import 'package:flutter/material.dart';
import 'add_artwork_screen.dart';
import 'showcase_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Artfolio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AddArtworkScreen(),
                  ),
                );
              },
              child: Text('Add Artwork'),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ShowcaseScreen(),
                  ),
                );
              },
              child: Text('Showcase Artworks'),
            ),
          ],
        ),
      ),
    );
  }
}

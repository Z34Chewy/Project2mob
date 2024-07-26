import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'register.dart';
import 'homepage.dart';
import 'gallery.dart';
import 'artists.dart';
import 'art_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artfolio',
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        if (settings.name == '/artDetail') {
          final args = settings.arguments as DocumentSnapshot;
          return MaterialPageRoute(
            builder: (context) => ArtDetailScreen(art: args),
          );
        }
        // Handle other routes
        return null;
      },
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/homepage': (context) => Homepage(),
        '/gallery': (context) => GalleryScreen(),
        '/artists': (context) => ArtistsScreen(),
      },
    );
  }
}
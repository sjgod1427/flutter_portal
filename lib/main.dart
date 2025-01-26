import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_portal/home.dart';
import 'package:flutter_portal/login.dart';
// Import your HomeScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWrapper(), // Use AuthWrapper to handle login state
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    User? user = FirebaseAuth.instance.currentUser;

    // If the user is logged in, navigate to the HomeScreen
    if (user != null) {
      return HomeScreen(); // Replace with your home screen widget
    } else {
      // If the user is not logged in, navigate to the LoginScreen
      return LoginScreen();
    }
  }
}

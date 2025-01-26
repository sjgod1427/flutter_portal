import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //for storing data in the cloud
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //for authentication in flutter
  final FirebaseAuth _auth = FirebaseAuth.instance;

//for sign up
  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required String name}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          username.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // for adding user to our firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          "name": name,
          "email": email,
          "uid": credential.user!.uid,
          "username": username,
          "wallet": 10
          // we can not store the password on the cloud
        });
        res = "Successfull";
      } // for registering user in the firebase auth with emial and password
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //login user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all field";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void handleGoogleSignIn() async {
    try {
      GoogleAuthProvider _googlrAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googlrAuthProvider);
    } catch (e) {
      print(e);
    }
  }

  // Future<String?> signInWithGoogle(BuildContext context) async {
  //   try {
  //     // Trigger the Google Sign-In flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     if (googleUser == null) {
  //       // The user canceled the sign-in
  //       return null;
  //     }

  //     // Obtain the auth details from the Google Sign-In
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     // Create a new credential
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Sign in to Firebase with the Google credentials
  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     // Retrieve the Firebase ID token
  //     final String? token = await userCredential.user?.getIdToken();
  //     print('Token: $token'); // Log or use this token as needed

  //     // Navigate to the Home Screen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );

  //     return token;
  //   } catch (e) {
  //     print('Error during Google Sign-In: $e');
  //     return null;
  //   }
  // }

  Future<String?> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain the Google account email
      final String? email = googleUser.email;

      // Check if a user with this email exists in Firestore
      final QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      bool isNewUser = userQuery.docs.isEmpty;

      String? name;
      String? username;
      bool isUsernameTaken = false;

      if (isNewUser) {
        // If the user is new, prompt for name and username
        while (true) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Welcome!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) => name = value,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Username'),
                      onChanged: (value) => username = value,
                    ),
                    if (isUsernameTaken)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Username already exists. Please try another.',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text('Submit'),
                  ),
                ],
              );
            },
          );

          if (name != null &&
              username != null &&
              name!.isNotEmpty &&
              username!.isNotEmpty) {
            // Check if the username is already taken
            final QuerySnapshot usernameQuery = await FirebaseFirestore.instance
                .collection('users')
                .where('username', isEqualTo: username)
                .get();

            if (usernameQuery.docs.isEmpty) {
              isUsernameTaken = false; // Username is unique
              break; // Exit the loop
            } else {
              isUsernameTaken = true; // Username is already taken
            }
          } else {
            print('User canceled the dialog');
            return null;
          }
        }
      }

      // Sign in to Firebase with the Google credentials
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) {
        print('User is null after sign-in');
        return null;
      }

      if (isNewUser) {
        // Save the user's data in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'username': username,
          'email': email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'wallet': 10
        });
      }

      // Navigate to the Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Placeholder()),
      );

      return await user.getIdToken();
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }
}

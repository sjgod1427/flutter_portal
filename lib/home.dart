// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import 'package:flutter_portal/bubbleBounce/bubbleBounce.dart';
// import 'package:flutter_portal/bubbleRush/bubblerush.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // GIF Background
//           SizedBox.expand(
//             child: Image.asset(
//               'assets/images/bubbles_background.gif', // Replace with your GIF file path
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Main content
//           SafeArea(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Title
//                   Text(
//                     'Bubble World',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.yellowAccent,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10.0,
//                           color: Colors.yellow,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   // Game buttons
//                   _buildBubbleButton(
//                     context: context,
//                     label: 'Pop The Bubble',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               GameScreen(gameFile: 'assets/game/index.html'),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   _buildBubbleButton(
//                     context: context,
//                     label: 'Bubble Blast',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               GameScreen(gameFile: 'assets/game/index1.html'),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   _buildBubbleButton(
//                     context: context,
//                     label: 'Bubble Rush',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => BubbleRush()),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   _buildBubbleButton(
//                     context: context,
//                     label: 'Bubble Bounce',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Bubblebounce()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Bubble-styled button
//   Widget _buildBubbleButton({
//     required BuildContext context,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.yellowAccent.withOpacity(0.8),
//         foregroundColor: Colors.black,
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50),
//         ),
//         elevation: 10,
//         shadowColor: Colors.yellowAccent,
//       ),
//       child: Text(
//         label,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class GameScreen extends StatelessWidget {
//   final String gameFile;

//   GameScreen({required this.gameFile});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // GIF Background
//           SizedBox.expand(
//             child: Image.asset(
//               'assets/background.gif', // Replace with your GIF file path
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Main content (WebView)
//           SafeArea(
//             child: Column(
//               children: [
//                 // AppBar-like header
//                 Container(
//                   color:
//                       Colors.black.withOpacity(0.7), // Semi-transparent black
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Game',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.yellowAccent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // WebView for the game
//                 Expanded(
//                   child: InAppWebView(
//                     initialFile: gameFile, // Load the selected game file
//                     initialOptions: InAppWebViewGroupOptions(
//                       crossPlatform: InAppWebViewOptions(
//                         javaScriptEnabled: true,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_portal/login.dart'; // Import your LoginScreen
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:flutter_portal/bubbleBounce/bubbleBounce.dart';
import 'package:flutter_portal/bubbleRush/bubblerush.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GIF Background
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bubbles_background.gif', // Replace with your GIF file path
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    'Bubble World',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.yellow,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Game buttons
                  _buildBubbleButton(
                    context: context,
                    label: 'Pop The Bubble',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(gameFile: 'assets/game/index.html'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildBubbleButton(
                    context: context,
                    label: 'Bubble Blast',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameScreen(gameFile: 'assets/game/index1.html'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildBubbleButton(
                    context: context,
                    label: 'Bubble Rush',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BubbleRush()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildBubbleButton(
                    context: context,
                    label: 'Bubble Bounce',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bubblebounce()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Logout Button (Stacked on top-right corner)
          Positioned(
            top: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                // Log out the user
                await FirebaseAuth.instance.signOut();

                // Navigate back to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellowAccent.withOpacity(0.8),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 5),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bubble-styled button
  Widget _buildBubbleButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellowAccent.withOpacity(0.8),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 10,
        shadowColor: Colors.yellowAccent,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  final String gameFile;

  GameScreen({required this.gameFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GIF Background
          SizedBox.expand(
            child: Image.asset(
              'assets/background.gif', // Replace with your GIF file path
              fit: BoxFit.cover,
            ),
          ),

          // Main content (WebView)
          SafeArea(
            child: Column(
              children: [
                // AppBar-like header
                Container(
                  color:
                      Colors.black.withOpacity(0.7), // Semi-transparent black
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Game',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                // WebView for the game
                Expanded(
                  child: InAppWebView(
                    initialFile: gameFile, // Load the selected game file
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

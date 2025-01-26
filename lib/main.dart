import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_portal/bubbleBounce/bubbleBounce.dart';
import 'package:flutter_portal/bubbleRush/bubblerush.dart';

void main() {
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Game 1 (index.html)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GameScreen(gameFile: 'assets/game/index.html'),
                  ),
                );
              },
              child: Text('Play Game 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Game 2 (index1.html)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GameScreen(gameFile: 'assets/game/index1.html'),
                  ),
                );
              },
              child: Text('Play Game 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Game 1 (index.html)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BubbleRush()),
                );
              },
              child: Text('Play Game 3'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Game 1 (index.html)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bubblebounce()),
                );
              },
              child: Text('Play Game 4'),
            ),
          ],
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
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: InAppWebView(
        initialFile: gameFile, // Load the selected game file
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
        // AutomaticallyImplyLeading is true by default, 
        // but since we used pushReplacement, no back arrow appears.
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home, 
              size: 100, 
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome Home!',
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You have completed the onboarding.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
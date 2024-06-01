import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Background color with opacity for semi-transparent effect
      body: Center(
        child: CircularProgressIndicator(), // Circular loading indicator
      ),
    );
  }
}

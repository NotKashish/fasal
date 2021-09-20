import 'package:fasal/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  
  final IconData icon;
  final String text;
  
  LoadingPage({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: darkGreen,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

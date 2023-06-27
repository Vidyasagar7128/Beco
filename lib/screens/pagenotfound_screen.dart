import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Page Not Found'),
            FilledButton.tonal(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UnAuthenticatedPage extends StatelessWidget {
  const UnAuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('UnAuthenticated User'),
      ),
    );
  }
}

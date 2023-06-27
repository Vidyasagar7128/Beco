import 'package:flutter/material.dart';

import 'bookroom_screen.dart';

class PrimeUserScreen extends StatelessWidget {
  const PrimeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BookRoomScreen())),
          child: const Text('data'),
        ),
      ),
    );
  }
}

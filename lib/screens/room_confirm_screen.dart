import 'package:flutter/material.dart';

import '../widgets/textcustom.dart';

class RoomConfirmScreen extends StatelessWidget {
  const RoomConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm And Pay'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          TextCustom(
            left: 10.0,
            child: Text(
              'Total',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            height: 150.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('data'),
                    Text('Price'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(),
        margin: EdgeInsets.zero,
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                    onPressed: () {}, child: const Text('Pay')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

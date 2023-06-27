import 'package:flutter/material.dart';

class BookRoomScreen extends StatelessWidget {
  const BookRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking details'),
      ),
      body: Card(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: 170.0,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title of the Room',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 22.0),
                        ),
                        Text(
                          'Location of the Room',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 17.0),
                        ),
                        const SizedBox(height: 7.0),
                        const Text(
                          '2BHK for 2 Adults and 1 Child',
                        ),
                        const Text(
                          '22 Mon, 2023 to 25 Mon, 2023',
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'Total : 899',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        child: FilledButton.tonal(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(20.0))),
          onPressed: () {},
          child: Text(
            'Pay & Confirm',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

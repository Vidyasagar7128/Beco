import 'package:flutter/material.dart';

class CityCardWidget extends StatelessWidget {
  const CityCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 0.0,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        onTap: () => Navigator.pushNamed(context, '/details'),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.0,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Text(
                      'A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 15.0,
                      child: Icon(
                        Icons.electric_bolt,
                        color: index % 2 == 0 ? Colors.grey : Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToFromSearchWidget extends StatelessWidget {
  const ToFromSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search city',
                      prefixIcon: Icon(
                        Icons.location_city,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              FilledButton.icon(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0))),
                  onPressed: () => Navigator.pushNamed(context, '/result'),
                  icon: const Icon(Icons.search),
                  label: const Text('Search'))
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.purple,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.today),
                      border: InputBorder.none,
                      hintText: 'Check in Date',
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.purple,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.today),
                      border: InputBorder.none,
                      hintText: 'Check out Date',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

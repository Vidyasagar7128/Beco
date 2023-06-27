import 'package:flutter/material.dart';

class TopVillasAndHomeWidget extends StatelessWidget {
  final String heading;
  const TopVillasAndHomeWidget({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
            child: Text(
              heading,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: 145.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10 + 1,
              itemBuilder: (context, index) => index == 10
                  ? InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Load more',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Card(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/details'),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                          ),
                          width: size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100.0,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    // Text(
                                    //   'A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.',
                                    //   style: Theme.of(context).textTheme.titleLarge,
                                    // ),
                                    Text(
                                      'A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

class CitiesAvatarWidget extends StatelessWidget {
  const CitiesAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 90.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) => SizedBox(
            width: 90.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  log('Clicked!');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).iconTheme.color,
                        radius: 30.0,
                      ),
                    ),
                    Text(
                      'City $index',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

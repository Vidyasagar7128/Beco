import 'dart:developer';
import 'package:beco/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchAndCitiesWidget extends StatelessWidget {
  const SearchAndCitiesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Column(
        children: [
          Container(
            height: 50.0,
            margin: const EdgeInsets.only(top: 15.0, left: 7.0, right: 7.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              color: Colors.purple.shade100,
            ),
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              onTap: () {
                log("Ok!");
                Navigator.pushNamed(context, '/search');
              },
              child: const TextField(
                enableInteractiveSelection: false,
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search here',
                  // hintStyle: TextStyle(
                  //   color: Colors.black,
                  // ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          const SizedBox(
            height: 90.0,
            child: CitiesAvatarWidget(),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

import 'package:beco/models/search_arguments_model.dart';
import 'package:flutter/material.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? isFlexibleSearch =
        ModalRoute.of(context)?.settings.arguments as bool?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Select Destination'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            margin:
                const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            //height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search Here',
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.my_location),
                ),
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            if (isFlexibleSearch != null && isFlexibleSearch) {
              Navigator.pop(context, 'Location : $index ');
            } else {
              Navigator.pushNamed(
                context,
                '/result',
                arguments: SearchArgumentsModel(
                    query: 'Location : $index ',
                    room: 0,
                    adults: 0,
                    childerns: 0,
                    isFlexSearch: false,
                    toFrom: null),
              );
            }
          },
          title: Text('Location $index'),
        ),
      ),
    );
  }
}

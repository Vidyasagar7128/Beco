import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: SearchAnchor.bar(
        onTap: () {},
        searchController: _controller,
        barElevation: const MaterialStatePropertyAll<double>(0),
        isFullScreen: true,
        barTrailing: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.my_location))
        ],
        suggestionsBuilder: ((context, controller) => List.generate(
              10,
              (index) => const ListTile(
                title: Text('data'),
              ),
            )),
      ),
    ));
  }
}

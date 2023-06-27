import 'package:beco/models/search_arguments_model.dart';
import 'package:beco/widgets/citycardwidget.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SearchArgumentsModel;

    return Scaffold(
      // bottomSheet: SizedBox(
      //   height: 120.0,
      // ),
      appBar: AppBar(
        title: GestureDetector(
            onTap: () => Navigator.pop(context), child: Text(args.query)),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => const CityCardWidget(),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => showFilters(context),
        child: const Icon(Icons.filter_alt),
      ),
    );
  }

  void showFilters(BuildContext context) {
    showModalBottomSheet(
        showDragHandle: true,
        builder: (BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                NavigationRail(
                  useIndicator: true,
                  labelType: NavigationRailLabelType.none,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.verified_user_sharp),
                      label: Text(
                        'One',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.star),
                      label: Text(
                        'Two',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  selectedIndex: 0,
                ),
                const Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              ],
            ),
          );
        },
        context: context);
  }
}

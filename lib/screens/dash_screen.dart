import 'package:beco/screens/filter/filter_one.dart';
import 'package:beco/screens/home_screen.dart';
import 'package:beco/screens/profile_screen.dart';
import 'package:beco/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'searchlocation_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const SearchLocationScreen(),
    const ExploreScreen(),
    Container(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: NavigationBarWidget(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
        ),
        // bottomNavigationBar: CustomTabBar(
        //   icons: _icons,
        //   selectedIndex: _selectedIndex,
        //   onTap: (index) => setState(() => _selectedIndex = index),
        // ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => showFilters(context),
          child: const Icon(Icons.tune),
        ),
      ),
    );
  }

  void showFilters(BuildContext context) {
    int filterIndex = 0;
    List<Widget> filterScreens = [
      const FilterOne(),
      Container(),
      Container(),
      Container(),
    ];
    showModalBottomSheet(
        showDragHandle: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, state) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationRail(
                  useIndicator: true,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      padding: EdgeInsets.only(bottom: 10.0),
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('First'),
                    ),
                    NavigationRailDestination(
                      padding: EdgeInsets.only(bottom: 10.0),
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('First'),
                    ),
                    NavigationRailDestination(
                      padding: EdgeInsets.only(bottom: 10.0),
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('First'),
                    ),
                    NavigationRailDestination(
                      padding: EdgeInsets.only(bottom: 10.0),
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('First'),
                    ),
                  ],
                  selectedIndex: filterIndex,
                  onDestinationSelected: (int index) {
                    state(() => filterIndex = index);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: filterScreens[filterIndex],
                  ),
                ),
              ],
            ),
          );
        },
        context: context);
  }
}

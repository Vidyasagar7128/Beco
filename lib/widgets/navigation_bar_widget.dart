import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    this.destinations,
    required this.selectedIndex,
    required this.onTap,
  });
  final List<Widget>? destinations;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 1.0,
      onDestinationSelected: onTap,
      selectedIndex: selectedIndex,
      destinations: [
        NavigationDestination(
          selectedIcon:
              Icon(Icons.home, color: Theme.of(context).iconTheme.color),
          icon: Icon(Icons.home, color: Theme.of(context).primaryColor),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon:
              Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          label: 'Search',
        ),
        NavigationDestination(
          selectedIcon:
              Icon(Icons.explore, color: Theme.of(context).iconTheme.color),
          icon: Icon(Icons.explore, color: Theme.of(context).primaryColor),
          label: 'Explore',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.chat_bubble_outline,
              color: Theme.of(context).iconTheme.color),
          icon: Icon(Icons.chat_bubble_outline,
              color: Theme.of(context).primaryColor),
          label: 'Chat',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.account_circle,
              color: Theme.of(context).iconTheme.color),
          icon:
              Icon(Icons.account_circle, color: Theme.of(context).primaryColor),
          label: 'Profile',
        ),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    );
  }
}

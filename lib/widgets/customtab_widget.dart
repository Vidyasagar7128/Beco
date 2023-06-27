import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  });

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool? isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        border: isBottomIndicator!
            ? const Border(
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex ? Colors.blue : Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }
}

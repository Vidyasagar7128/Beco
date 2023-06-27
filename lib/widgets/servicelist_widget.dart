import 'package:flutter/material.dart';

class ServicesListWidget extends StatelessWidget {
  const ServicesListWidget({
    super.key,
    required this.menuIcons,
    required this.showLabels,
    required this.width,
  });
  final List<IconData> menuIcons;
  final bool showLabels;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: menuIcons.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          height: double.infinity,
          width: width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: Icon(menuIcons[index]),
              ),
              showLabels
                  ? Text(menuIcons[index].toString())
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

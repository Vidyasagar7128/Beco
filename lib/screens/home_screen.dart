import 'package:beco/widgets/flex_search_widget.dart';
import 'package:flutter/material.dart';
import '../assets/components.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text('Beco'),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: CitiesAvatarWidget(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: FilledButton.tonalIcon(
                        style: Theme.of(context).filledButtonTheme.style,
                        onPressed: () {},
                        icon: const Icon(Icons.home),
                        label: const Text(
                          'Villa',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: FilledButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(12.0))),
                      onPressed: () {},
                      child: const Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: FilledButton.tonalIcon(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(12.0))),
                        onPressed: () {},
                        icon: const Icon(Icons.home),
                        label: const Text(
                          'Flat',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
            sliver: SliverToBoxAdapter(
              child: FlexSearchWidget(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => Card(
                      //margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0.0,
                      child: InkWell(
                        splashColor: Theme.of(context).cardTheme.color,
                        onTap: () =>
                            Navigator.pushNamed(context, '/flex-search'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              menuIcons[index],
                              size: 30.0,
                            ),
                            Text(
                              menuLabel[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )),
                childCount: menuIcons.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0.0,
                crossAxisCount: 4,
                mainAxisSpacing: 0.0,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child:
                TopVillasAndHomeWidget(heading: 'Top home\'s and apartments'),
          ),
          const SliverToBoxAdapter(
            child: TopVillasAndHomeWidget(
              heading: 'Recently searched',
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;
}

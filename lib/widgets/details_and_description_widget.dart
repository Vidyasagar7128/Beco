import 'package:flutter/material.dart';

class DetailsAndDiscriptionWidget extends StatefulWidget {
  const DetailsAndDiscriptionWidget({super.key});

  @override
  State<DetailsAndDiscriptionWidget> createState() =>
      _DetailsAndDiscriptionWidgetState();
}

class _DetailsAndDiscriptionWidgetState
    extends State<DetailsAndDiscriptionWidget> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0.0,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(
                text: 'Details',
              ),
              Tab(
                text: 'Seller',
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 300.0,
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'Details about Pet.Restarted application in 1,002ms.Restarted application in 1,002ms.Restarted application in 1,002ms',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(overflow: TextOverflow.visible),
                ),
                Text(
                  'Details about Seller',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

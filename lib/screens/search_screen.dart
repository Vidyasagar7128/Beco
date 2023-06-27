import 'dart:developer';

import 'package:beco/models/search_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //DateTime date = DateTime.now();

  DateTimeRange? newDateRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(const Duration(days: 1)));
  TextEditingController queryController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? controller;
  bool typing = false;
  int room = 1;
  int adults = 1;
  int childerns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          textInputAction: TextInputAction.search,
          controller: queryController,
          onChanged: (val) {
            if (val.isNotEmpty) {
              setState(() {
                typing = true;
              });
            } else {
              setState(() {
                typing = false;
              });
            }
          },
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            prefixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            suffixIcon: IconButton(
              onPressed: () {
                queryController.text = "";
                setState(() {
                  typing = false;
                });
              },
              icon: typing ? const Icon(Icons.close) : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
      body: typing
          ? ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  editMembers(context);
                  //_settingModalBottomSheet(context);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                title: Text(queryController.text),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<DateTimeRange?> showDate(context) async {
    DateTime now = DateTime.now();
    return await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime(now.year, now.month, now.day),
        end: DateTime(now.year, now.month, now.day),
      ),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year, now.month + 3),
      helpText: 'Select a date',
    ).then((date) {
      log('SHow $date');
      return date;
    });
  }

  void editMembers(BuildContext context) {
    showModalBottomSheet(
            enableDrag: false,
            isDismissible: false,
            isScrollControlled: false,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, state) => Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  height: 240.0,
                  child: Column(
                    children: [
                      Container(
                        //height: 45.0,
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        margin: const EdgeInsets.symmetric(horizontal: 7.0),
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(queryController.text),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                  context,
                                  '/result',
                                  arguments: SearchArgumentsModel(
                                    query: queryController.text,
                                    room: room,
                                    adults: adults,
                                    childerns: childerns,
                                    isFlexSearch: true,
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Text('1'),
                        title: Row(
                          children: [
                            const Text('Room'),
                            const Spacer(),
                            Text('$room'),
                            const SizedBox(width: 5.0),
                            IconButton(
                              onPressed: () => counterDecrement("Room", state),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => counterIncrement("Room", state),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      ListTile(
                        leading: const Text('2'),
                        title: Row(
                          children: [
                            const Text('Adults'),
                            const Spacer(),
                            Text('$adults'),
                            const SizedBox(width: 5.0),
                            IconButton(
                              onPressed: () =>
                                  counterDecrement("Adults", state),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => counterIncrement("Adults", state),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      ListTile(
                        leading: const Text('3'),
                        title: Row(
                          children: [
                            const Text('Childerns'),
                            const Spacer(),
                            Text('$childerns'),
                            const SizedBox(width: 5.0),
                            IconButton(
                              onPressed: () =>
                                  counterDecrement("Childerns", state),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => counterIncrement("Childerns", state),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () async {
                                  DateTimeRange? getNewDateRange =
                                      await showDate(context);
                                  if (getNewDateRange == null) {
                                    newDateRange = DateTimeRange(
                                        start: DateTime.now(),
                                        end: DateTime.now()
                                            .add(const Duration(days: 1)));
                                  } else {
                                    newDateRange = getNewDateRange;
                                  }
                                  state(() {});
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat('d MMM, yyyy').format(
                                              newDateRange!.start,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            thickness: 2,
                                            width: 20,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            DateFormat('d MMM, yyyy').format(
                                              newDateRange!.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            context: context)
        .whenComplete(() => log('Closed Done'));
  }

  // void _settingModalBottomSheet(context) {
  //   controller =
  //       _scaffoldKey.currentState!.showBottomSheet((BuildContext context) {
  //     return Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: const [
  //         Padding(
  //             padding: EdgeInsets.all(16.0),
  //             child: Text(
  //               'Some title!',
  //               textAlign: TextAlign.left,
  //             )),
  //         Text(
  //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper massa metus, sed pharetra mauris porttitor et. Nullam ac ultrices leo. Praesent sed consequat risus. ',
  //           textAlign: TextAlign.left,
  //         ),
  //       ],
  //     );
  //   });
  // }

  void counterIncrement(String type, Function state) {
    if (type == "Room") {
      room += 1;
    } else if (type == "Adults") {
      adults += 1;
    } else if (type == "Childerns") {
      childerns += 1;
    } else {
      return;
    }
    state(() {});
  }

  void counterDecrement(String type, Function state) {
    if (type == "Room" && room >= 2) {
      room -= 1;
    } else if (type == "Adults" && adults >= 2) {
      adults -= 1;
    } else if (type == "Childerns" && childerns >= 1) {
      childerns -= 1;
    } else {
      return;
    }
    state(() {});
  }
}

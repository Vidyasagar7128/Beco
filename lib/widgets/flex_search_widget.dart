//import 'dart:math';
import 'package:beco/models/search_arguments_model.dart';
import 'package:beco/services/cubit/flexsearch_cubit.dart';
import 'package:beco/widgets/location_tile_widget.dart';
import 'package:beco/widgets/to_from_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/textfield_component.dart';

class FlexSearchWidget extends StatelessWidget {
  const FlexSearchWidget({super.key});

  // final TextEditingController roomsController =
  //     TextEditingController(text: '1');
  // final TextEditingController adultsController =
  //     TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    FlexsearchCubit searchBloc = context.read<FlexsearchCubit>();
    return BlocBuilder<FlexsearchCubit, SearchArgumentsModel>(
      builder: (context, state) {
        // roomsController.text = state.room.toString();
        // adultsController.text = state.adults.toString();
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationTileWidget(
                cityLocation: (String location) =>
                    searchBloc.addLocation(location),
              ),
              ToFromDateWidget(
                  dateRangeCallback: (DateTimeRange dateTimeRange) =>
                      searchBloc.dateRange(dateTimeRange)),
              Tile(
                changes: (p0, p1) {
                  searchBloc.addRooms(p0);
                  searchBloc.addAdults(p1);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.map,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: FilledButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/result',
                    arguments: SearchArgumentsModel(
                      query: state.query,
                      room: state.room,
                      adults: state.adults,
                      childerns: state.childerns,
                      isFlexSearch: true,
                      toFrom: state.toFrom!,
                    ),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
      },
    );
  }
}

typedef RoomAndAdultsChanges = void Function(int, int);

class Tile extends StatefulWidget {
  const Tile({
    super.key,
    required this.changes,
  });

  final RoomAndAdultsChanges changes;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  final TextEditingController roomsController =
      TextEditingController(text: '1');

  final TextEditingController adultsController =
      TextEditingController(text: '1');

  @override
  void dispose() {
    roomsController.dispose();
    adultsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        List<int> dialogData = await dialog(context);
        widget.changes(dialogData[0], dialogData[1]);
      },
      minLeadingWidth: 0.0,
      leading: Icon(
        Icons.search,
        color: Theme.of(context).iconTheme.color,
      ),
      title: BlocBuilder<FlexsearchCubit, SearchArgumentsModel>(
        builder: (context, state) {
          return Text('${state.room} Room ${state.adults} Adult');
        },
      ),
    );
  }

  Future dialog(BuildContext context) {
    FlexsearchCubit searchBloc = context.read<FlexsearchCubit>();
    roomsController.text = searchBloc.state.room.toString();
    adultsController.text = searchBloc.state.adults.toString();
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select options',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldComponent(
                            controller: roomsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              labelText: 'Room',
                            ),
                            data: (String val) => roomsController.text = val,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: TextFieldComponent(
                            controller: adultsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(),
                              labelText: 'Adult',
                            ),
                            data: (String val) => adultsController.text = val,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context,
                              [searchBloc.state.room, searchBloc.state.adults]),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 20.0),
                        FilledButton.tonal(
                          onPressed: () {
                            Navigator.pop(context, [
                              int.parse(roomsController.text),
                              int.parse(adultsController.text)
                            ]);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}

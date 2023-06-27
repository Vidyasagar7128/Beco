import 'dart:developer';

import 'package:beco/models/search_arguments_model.dart';
import 'package:beco/widgets/location_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/cubit/flexsearch_cubit.dart';
import '../widgets/to_from_date_widget.dart';

class FlexibleSearchScreen extends StatefulWidget {
  const FlexibleSearchScreen({super.key});

  @override
  State<FlexibleSearchScreen> createState() => _FlexibleSearchScreenState();
}

class _FlexibleSearchScreenState extends State<FlexibleSearchScreen> {
  DateTimeRange? newDateRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(const Duration(days: 1)));
  String? selectedLocation = "Current Location";

  @override
  Widget build(BuildContext context) {
    FlexsearchCubit searchBloc = context.read<FlexsearchCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Homes & Apts'),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationTileWidget(
              cityLocation: (String location) {},
            ),
            ToFromDateWidget(
              dateRangeCallback: (DateTimeRange dateTimeRange) =>
                  searchBloc.dateRange(dateTimeRange),
            ),
            ListTile(
              onTap: () {
                log(selectedLocation.toString());
                log(newDateRange.toString());
              },
              minLeadingWidth: 0.0,
              leading: const Icon(Icons.search),
              title: const Text('1 Room 1 Adult'),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: FilledButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: SearchArgumentsModel(
                    query: selectedLocation!,
                    room: 1,
                    adults: 1,
                    childerns: 1,
                    isFlexSearch: true,
                    toFrom: newDateRange!,
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
      ),
    );
  }
}

import 'package:beco/services/cubit/flexsearch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef StringCallback = void Function(String value);

class LocationTileWidget extends StatelessWidget {
  const LocationTileWidget({super.key, required this.cityLocation});
  final StringCallback cityLocation;

  @override
  Widget build(BuildContext context) {
    FlexsearchCubit searchCubit = context.read<FlexsearchCubit>();
    return ListTile(
      onTap: () async {
        String location = await Navigator.pushNamed(
            context, '/searchbylocation',
            arguments: true) as String;
        cityLocation(location);
        //setState(() {});
      },
      minLeadingWidth: 0.0,
      leading: Icon(
        Icons.search,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(searchCubit.state.query),
    );
  }
}

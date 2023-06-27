import 'dart:developer';

import 'package:beco/services/cubit/flexsearch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

typedef ToFromDateTimeRangeCallback = void Function(
    DateTimeRange dateTimeRange);

class ToFromDateWidget extends StatelessWidget {
  const ToFromDateWidget({super.key, required this.dateRangeCallback});
  final ToFromDateTimeRangeCallback dateRangeCallback;

  @override
  Widget build(BuildContext context) {
    var searchBloc = context.read<FlexsearchCubit>();
    return ListTile(
        onTap: () async {
          DateTimeRange? dateTimeRange =
              await showDate(context) ?? searchBloc.state.toFrom;
          searchBloc.dateRange(dateTimeRange!);
          log(dateTimeRange.start.toString());
          dateRangeCallback(dateTimeRange);
        },
        minLeadingWidth: 0.0,
        leading: Icon(
          Icons.calendar_month,
          color: Theme.of(context).iconTheme.color,
        ),
        title: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                DateFormat('d MMM, yyyy').format(
                  searchBloc.state.toFrom!.start,
                ),
              ),
              const SizedBox(width: 10.0),
              const VerticalDivider(
                indent: 3.0,
                endIndent: 3.0,
                thickness: 2,
                width: 10,
                color: Colors.grey,
              ),
              const SizedBox(width: 10.0),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    DateFormat('d MMM, yyyy').format(
                      searchBloc.state.toFrom!.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
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
    );
  }
}

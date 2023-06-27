import 'package:beco/models/search_arguments_model.dart';
import 'package:bloc/bloc.dart';
//import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//part 'flexsearch_state.dart';

class FlexsearchCubit extends Cubit<SearchArgumentsModel> {
  FlexsearchCubit()
      : super(
          SearchArgumentsModel(
            isFlexSearch: true,
            query: 'Current Location',
            room: 1,
            adults: 1,
            childerns: 0,
            toFrom: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(
                const Duration(days: 1),
              ),
            ),
          ),
        );

  void addLocation(String location) {
    emit(state.copyWith(query: location));
  }

  void dateRange(DateTimeRange dateTimeRange) {
    emit(state.copyWith(toFrom: dateTimeRange));
  }

  void addRooms(int rooms) {
    emit(state.copyWith(room: rooms));
  }

  void addAdults(int adults) {
    emit(state.copyWith(adults: adults));
  }
}

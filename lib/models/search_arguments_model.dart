import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchArgumentsModel extends Equatable {
  const SearchArgumentsModel({
    required this.query,
    required this.room,
    required this.adults,
    required this.childerns,
    required this.isFlexSearch,
    this.toFrom,
  });

  final String query;
  final int room;
  final int adults;
  final int childerns;
  final bool isFlexSearch;
  final DateTimeRange? toFrom;

  SearchArgumentsModel copyWith({
    String? query,
    int? room,
    int? adults,
    int? childerns,
    bool? isFlexSearch,
    DateTimeRange? toFrom,
  }) {
    return SearchArgumentsModel(
      query: query ?? this.query,
      room: room ?? this.room,
      adults: adults ?? this.adults,
      childerns: childerns ?? this.childerns,
      isFlexSearch: isFlexSearch ?? this.isFlexSearch,
      toFrom: toFrom ?? this.toFrom,
    );
  }

  @override
  List<Object?> get props =>
      [query, room, adults, childerns, isFlexSearch, toFrom];
}

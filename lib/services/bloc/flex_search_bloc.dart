import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flex_search_event.dart';
part 'flex_search_state.dart';

class FlexSearchBloc extends Bloc<FlexSearchEvent, FlexSearchState> {
  FlexSearchBloc() : super(FlexSearchInitial()) {
    on<FlexSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

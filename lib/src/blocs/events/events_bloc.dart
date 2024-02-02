import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:boletera/src/models/event_model.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  late GlobalKey<FormState> formKey;

  EventsBloc() : super(EventsState()) {
    on<GetEventData>((event, emit) => emit(state.copyWith()));
  }

  void resetFormKey(GlobalKey<FormState> key) {
    formKey = key;
  }
}

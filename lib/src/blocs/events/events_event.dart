part of 'events_bloc.dart';

sealed class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

final class SetEventData extends EventsEvent {
  final Event event;
  
  const SetEventData(this.event);
}

final class SelectStep extends EventsEvent {
  final int step;
  
  const SelectStep(this.step);
}
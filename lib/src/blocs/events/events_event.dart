part of 'events_bloc.dart';

sealed class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

final class GetEventData extends EventsEvent {
  final Event event;
  const GetEventData(this.event);
}
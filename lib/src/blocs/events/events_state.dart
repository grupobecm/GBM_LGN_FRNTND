part of 'events_bloc.dart';

class EventsState extends Equatable {
  final Event event;

  const EventsState({
    this.event = const Event(
      eventID: 0,
      eventName: '',
      description: '',
      startDate: '',
      endDate: '',
      dateRegister: '',
      location: '',
      country: '',
      status: '',
      image: '',
      bannerImage: '',
      type: '',
      isForAdult: false,
      areas: [],
      category: [],
    ),
  });

  EventsState copyWith({
    Event? event,
  }) =>
      EventsState(
        event: event ?? this.event,
      );

  @override
  List<Object> get props => [event];
}

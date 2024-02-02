part of 'events_bloc.dart';

class EventsState extends Equatable {
  final Event event;

  static final DateTime date = DateTime(0000, 00, 00, 00, 00);

  EventsState({
    Event? event,
  }) : event = event ??
            Event(
              eventID: 0,
              eventName: '',
              description: '',
              startDate: date,
              endDate: date,
              dateRegister: date,
              location: '',
              country: '',
              status: '',
              image: '',
              bannerImage: '',
              type: '',
              isForAdult: false,
              areas: [],
              category: [],
            );

  EventsState copyWith({
    Event? event,
  }) =>
      EventsState(
        event: event ?? this.event,
      );

  @override
  List<Object> get props => [event];
}

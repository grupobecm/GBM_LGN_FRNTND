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
        event: Event(
          eventID: event?.eventID ?? this.event.eventID,
          eventName: event?.eventName ?? this.event.eventName,
          description: event?.description ?? this.event.description,
          startDate: event?.startDate ?? this.event.startDate,
          endDate: event?.endDate ?? this.event.endDate,
          dateRegister: event?.dateRegister ?? this.event.dateRegister,
          location: event?.location ?? this.event.location,
          country: event?.country ?? this.event.country,
          status: event?.status ?? this.event.status,
          image: event?.image ?? this.event.image,
          bannerImage: event?.bannerImage ?? this.event.bannerImage,
          type: event?.type ?? this.event.type,
          isForAdult: event?.isForAdult ?? this.event.isForAdult,
          areas: event?.areas ?? this.event.areas,
          category: event?.category ?? this.event.category,
        ),
      );

  @override
  List<Object> get props => [event];
}

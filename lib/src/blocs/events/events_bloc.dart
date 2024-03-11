import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/models/models.dart';
import 'package:boletera/src/services/services.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  late GlobalKey<FormState> formKey;

  late EventArea _area = const EventArea(areaID: 0, name: '', status: '');
  late EventPhase _phase = const EventPhase(
    phaseID: 0,
    name: '',
    description: '',
    startDate: '',
    endDate: '',
    quantity: 0,
    price: 0.0,
  );
  late EventLineup _lineup = const EventLineup(
    guestID: 0,
    name: '',
    description: '',
    urlWeb: '',
    urlFace: '',
    urlInsta: '',
    urlX: '',
    image: '',
  );

  final AuxiliaryCubit _auxiliaryCubit;

  EventsBloc({
    required AuxiliaryCubit auxiliaryCubit,
  })  : _auxiliaryCubit = auxiliaryCubit,
        super(const EventsState()) {
    on<SetEventData>((event, emit) => emit(state.copyWith(event: event.event)));
    on<SelectStep>((event, emit) => emit(state.copyWith(step: event.step)));
  }

  void resetFormKey(GlobalKey<FormState> key) {
    formKey = key;
  }

  void reserEvent() {
    add(const SetEventData(
      Event(
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
        phases: [],
        lineUp: [],
        category: [],
      ),
    ));
  }

  void resetArea() {
    _area = const EventArea(areaID: 0, name: '', status: '');
  }

  void resetPhase() {
    _phase = const EventPhase(
      phaseID: 0,
      name: '',
      description: '',
      startDate: '',
      endDate: '',
      quantity: 0,
      price: 0.0,
    );
  }

  void resetLineup() {
    _lineup = const EventLineup(
      guestID: 0,
      name: '',
      description: '',
      urlWeb: '',
      urlFace: '',
      urlInsta: '',
      urlX: '',
      image: '',
    );
  }

  void resetSteps() {
    add(const SelectStep(0));
  }

  void passStep() {
    int step = state.step;
    step++;

    add(SelectStep(step));
  }

  void returnStep() {
    int step = state.step;
    step--;

    add(SelectStep(step));
  }

  void setArea({String? name, String? status}) {
    _area = EventArea(areaID: 0, name: name ?? _area.name, status: status ?? _area.status);
  }

  void setPhase({String? name, String? description, String? startDate, String? endDate, int? quantity, double? price}) {
    _phase = EventPhase(
      phaseID: 0,
      name: name ?? _phase.name,
      description: description ?? _phase.description,
      startDate: startDate ?? _phase.startDate,
      endDate: endDate ?? _phase.endDate,
      quantity: quantity ?? _phase.quantity,
      price: price ?? _phase.price,
    );
  }

  void setLineup(
      {String? name,
      String? description,
      String? urlWeb,
      String? urlFace,
      String? urlInsta,
      String? urlX,
      dynamic image}) {
    _lineup = EventLineup(
      guestID: 0,
      name: name ?? _lineup.name,
      description: description ?? _lineup.description,
      urlWeb: urlWeb ?? _lineup.urlWeb,
      urlFace: urlFace ?? _lineup.urlFace,
      urlInsta: urlInsta ?? _lineup.urlInsta,
      urlX: urlX ?? _lineup.urlX,
      image: image ?? _lineup.image,
    );
  }

  void setEventData({
    int? id,
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    String? dateRegister,
    String? location,
    String? status,
    dynamic image,
    dynamic banner,
    String? type,
    bool? isForAdult,
    List<EventArea>? areas,
    List<EventPhase>? phases,
    List<EventLineup>? lineUp,
    List<Map<String, String>>? category,
  }) {
    add(
      SetEventData(Event(
        eventID: id ?? 0,
        eventName: name,
        description: description,
        startDate: startDate,
        endDate: endDate,
        dateRegister: dateRegister,
        location: location,
        country: 'México',
        status: status,
        image: image,
        bannerImage: banner,
        type: type,
        isForAdult: isForAdult,
        areas: areas ?? [],
        phases: phases ?? [],
        lineUp: lineUp ?? [],
        category: category ?? [],
      )),
    );
  }

  void saveArea() async {
    List<EventArea> list = List<EventArea>.from(state.event.areas ?? []);
    list.add(_area);

    setEventData(areas: list);
    resetArea();
  }

  void savePhase() {
    List<EventPhase> list = List<EventPhase>.from(state.event.phases ?? []);
    list.add(_phase);

    setEventData(phases: list);
    resetPhase();
  }

  void saveLineUp() {
    List<EventLineup> list = List<EventLineup>.from(state.event.lineUp ?? []);
    list.add(_lineup);

    setEventData(lineUp: list);
    resetLineup();
  }

  void setSelectedEvent(Map<String, dynamic> event) {
    reserEvent();
    setEventData(
      id: event['event_id'],
      name: event['event_name'],
      description: event['description'],
      status: event['status'],
      type: event['type'],
      isForAdult: event['is_for_adult'],
      location: event['location'],
      startDate: event['start_date'],
      endDate: event['end_date'],
      banner: event['image_banner'],
      image: event['url_image'],
      // lineUp: event[''],
      // areas: event[''],
      // phases: event[''],
    );
  }

  Future<void> createEvent(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    final graphQLClients = GraphQLClients();

    final novekClient = GraphQLClient(link: graphQLClients.link, cache: GraphQLCache());

    _auxiliaryCubit.changeLoadingState(true);

    try {
      // final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await novekClient.mutate(MutationOptions(
        document: gql(GraphQLClients.createEvent),
        fetchPolicy: FetchPolicy.networkOnly,
        errorPolicy: ErrorPolicy.all,
        // optimisticResult: client,
        variables: {
          'name': state.event.eventName,
          'description': state.event.description,
          'startDate': state.event.startDate,
          'endDate': state.event.endDate,
          'location': state.event.location,
          'isForAdult': state.event.isForAdult,
          'type': state.event.type,
          'image': state.event.image,
          'banner': state.event.bannerImage,
        },
      ));

      if (!result.hasException) {
        setEventData(id: result.data!['CreateEvent']);
        _auxiliaryCubit.changeCode('200');
      } else {
        print(result.exception!.linkException);
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<void> createArea(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _auxiliaryCubit.changeLoadingState(true);

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.createArea),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'event': state.event.eventName,
          'area': state.event.areas![state.event.areas!.length - 1].name,
          'status': state.event.areas![state.event.areas!.length - 1].status,
        },
      ));

      if (!result.hasException) {
        _auxiliaryCubit.changeCode('200');
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<void> createPhase(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _auxiliaryCubit.changeLoadingState(true);

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.createPhase),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'event': state.event.eventName, //TODO: Obtener ID del evento
          'phase': state.event.phases![state.event.phases!.length - 1].name,
          'description': state.event.phases![state.event.phases!.length - 1].description,
          'start_date': state.event.phases![state.event.phases!.length - 1].startDate,
          'end_date': state.event.phases![state.event.phases!.length - 1].endDate,
          'quantity': state.event.phases![state.event.phases!.length - 1].quantity,
          'price': state.event.phases![state.event.phases!.length - 1].price,
        },
      ));

      if (!result.hasException) {
        _auxiliaryCubit.changeCode('200');
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<void> getPhases(String eventID, BuildContext context) async {
    _auxiliaryCubit.changeLoadingState(true);

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.getPhases),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'id': eventID,
        },
      ));

      if (!result.hasException) {
        _auxiliaryCubit.changeCode('200');
        final List<EventPhase> list =
            (result.data!['GetPhases'] as List).map((item) => EventPhase.fromJson(item)).toList();

        setEventData(phases: list);

        print(list);
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<List<dynamic>> getEvents(BuildContext context) async {
    List<dynamic> list = [];
    _auxiliaryCubit.changeLoadingState(true);
    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.query(
        QueryOptions(
          document: gql(GraphQLClients.getEvents),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (!result.hasException) {
        _auxiliaryCubit.changeCode('200');
        list = result.data!['GetEvents'];
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (e) {
      _auxiliaryCubit.changeLoadingState(false);
    }

    _auxiliaryCubit.changeLoadingState(false);
    return list;
  }

  Widget getImage({required String url, bool contain = true}) {
    try {
      return Image.network(
        url,
        fit: contain ? BoxFit.contain : BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      );
    } catch (e) {
      return const Icon(Icons.error);
    }
  }
}

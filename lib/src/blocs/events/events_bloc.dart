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

  final MessageCubit _messageCubit;

  EventsBloc({
    required MessageCubit messageCubit,
  })  : _messageCubit = messageCubit,
        super(EventsState()) {
    on<SetEventData>((event, emit) => emit(state.copyWith(event: event.event)));
  }

  void resetFormKey(GlobalKey<FormState> key) {
    formKey = key;
  }

  void setEventData({
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? dateRegister,
    String? location,
    String? status,
    dynamic image,
    dynamic banner,
    String? type,
    bool? isForAdult,
    List<EventArea>? areas,
    List<Map<String, String>>? category,
  }) {
    add(
      SetEventData(Event(
        eventID: 0,
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
        category: category ?? [],
      )),
    );
  }

  void createEvent(BuildContext context) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    _messageCubit.changeLoadingState(true);

    try {
      final GraphQLClient client = GraphQLProvider.of(context).value;

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.createEvent),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {
          'name': state.event.eventName,
          'description': state.event.description,
          'startDate': state.event.startDate.toString(),
          'endDate': state.event.endDate.toString(),
          'location': state.event.location,
          'isForAdult': state.event.isForAdult,
          'type': state.event.type,
          'image': state.event.image,
          'banner': state.event.bannerImage,
        },
      ));

      if (!result.hasException) {
        _messageCubit.changeCode('200');
      } else {
        _messageCubit.changeCode('404');
      }
    } catch (error) {
      _messageCubit.changeCode('000');
      _messageCubit.changeLoadingState(false);
    }
    _messageCubit.changeLoadingState(false);
  }
}

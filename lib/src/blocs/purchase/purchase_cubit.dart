// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/services/services.dart';

import 'package:equatable/equatable.dart';
import 'package:http_parser/http_parser.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final AuxiliaryCubit _auxiliaryCubit;

  PurchaseCubit({
    required AuxiliaryCubit auxiliaryCubit,
    String ticketID = '68FE3F26-6844-49CE-B31C-295BC945262C',
    String firstName = 'Ramon',
    String lastName = 'Villalpando',
    String email = 'ramon.villalpando@polimentes.com',
    String secret = '',
  })  : _auxiliaryCubit = auxiliaryCubit,
        super(PurchaseState(
          ticketID: ticketID,
          firstName: firstName,
          lastName: lastName,
          email: email,
          secret: secret,
        ));

  Future<void> processPayment(BuildContext context) async {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    try {
      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.processPayment),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'id': state.ticketID,
          'method': 'pm_card_visa',
          'discount': '',
          'email': state.email,
          'firstname': state.firstName,
          'lastname': state.lastName,
        },
      ));

      if (!result.hasException) {
        // _auxiliaryCubit.changeCode('200');
        await stripePayment(result.data!['ProcessPayment']);
        if (_auxiliaryCubit.state.code == 'Succeeded') {
          await emailTicket(result.data!['ProcessPayment'], context);
        }
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<void> stripePayment(String skStripe) async {
    try {
      final result = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: skStripe,
        data: const PaymentMethodParams.cardFromMethodId(
          paymentMethodData: PaymentMethodDataCardFromMethod(paymentMethodId: 'pm_card_visa'),
        ),
      );

      _auxiliaryCubit.changeCode(result.status.name);
    } catch (error) {
      _auxiliaryCubit.changeCode('Error');
    }
  }

  Future<void> emailTicket(String skStripe, BuildContext context) async {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    try {
      final bytes = await loadImageAsUint8List('assets/images/Banner.png');

      final http.MultipartFile image = http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: 'ticket',
        contentType: MediaType(
          'image',
          'png',
        ),
      );

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.emailTicket),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'uuid': state.ticketID,
          'image': image,
          'places': const ["A1", "A2"],
          'discount': '',
          'sk': skStripe,
          'email': state.email,
          'firstName': state.firstName,
          'lastName': state.lastName,
        },
      ));

      if (!result.hasException) {
        // _auxiliaryCubit.changeCode('200');
        // await stripePayment(result.data!['ProcessPayment']);
      } else {
        _auxiliaryCubit.changeCode('404');
      }
    } catch (error) {
      _auxiliaryCubit.changeCode('000');
      _auxiliaryCubit.changeLoadingState(false);
    }
    _auxiliaryCubit.changeLoadingState(false);
  }

  Future<Uint8List> loadImageAsUint8List(String assetName) async {
  ByteData data = await rootBundle.load(assetName);
  List<int> bytes = data.buffer.asUint8List();
  return Uint8List.fromList(bytes);
}
}

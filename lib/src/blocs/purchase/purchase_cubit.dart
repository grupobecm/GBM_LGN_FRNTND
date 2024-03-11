// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:boletera/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
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
    // String ticketID = 'bfc8c118-b456-47b7-9dff-773e7578e923',
    // List<List<String>> phaseTicket = const [],
    // String firstName = 'Ramon',
    // String lastName = 'Villalpando',
    // String email = 'ramon.villalpando@polimentes.com',
    // String secret = '',
  })  : _auxiliaryCubit = auxiliaryCubit,
        super(const PurchaseState(
          orderData: PurchaseOrder(
            phasesID: [],
            ticketsID: [],
            firstName: '',
            lastName: '',
            email: '',
            secret: '',
          ),
        ));

  Future<void> processPayment(BuildContext context) async {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    try {
      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.processPayment),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'id': state.orderData.phasesID, // TODO: Obtener datos de face seleccionados.
          'method': 'pm_card_visa',
          'discount': '',
          'email': state.orderData.email,
          'firstname': state.orderData.firstName,
          'lastname': state.orderData.lastName,
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
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(bytes),
              ),
            );
          },
        ),
      );
      final pdf2 = await pdf.save();

      final http.MultipartFile image = http.MultipartFile.fromBytes(
        'ticket',
        pdf2,
        filename: 'ticket.pdf',
        contentType: MediaType(
          'application',
          'pdf',
        ),
      );

      final result = await client.mutate(MutationOptions(
        document: gql(GraphQLClients.emailTicket),
        fetchPolicy: FetchPolicy.networkOnly,
        optimisticResult: client,
        variables: {
          'uuid': "68FE3F26-6844-49CE-B31C-295BC945262C", // TODO: Obtener UUID de la face.
          'image': image,
          'places': const [],
          'discount': '',
          'sk': skStripe,
          'email': state.orderData.email,
          'firstName': state.orderData.firstName,
          'lastName': state.orderData.lastName,
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

  Future<Uint8List> loadImageAsUint8List(String assetName) async {
    ByteData data = await rootBundle.load(assetName);
    List<int> bytes = data.buffer.asUint8List();
    return Uint8List.fromList(bytes);
  }
}

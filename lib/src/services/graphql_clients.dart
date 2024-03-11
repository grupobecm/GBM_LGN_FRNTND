import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:boletera/src/services/services.dart';

class GraphQLClients {
  static final HttpLink _usersLink = HttpLink(dotenv.env['USERSLINK']!);
  static final HttpLink _novekLink = HttpLink(dotenv.env['NOVEKLINK']!);

  static final ValueNotifier<GraphQLClient> authClient =
      ValueNotifier(GraphQLClient(link: _usersLink, cache: GraphQLCache()));

  static final ValueNotifier<GraphQLClient> novekClient =
      ValueNotifier(GraphQLClient(link: _novekLink, cache: GraphQLCache()));

  late String? _jwt;
  late AuthLink _authLink;
  late Link link;

  GraphQLClients() {
    _jwt = LocalStorage.sharedPreferences.getString('jwt');
    _authLink = AuthLink(getToken: () async => 'Bearer $_jwt');
    link = _authLink.concat(_novekLink);
  }

  static const String startSession = """
    query LoginData(\$email: String!, \$pass: String!) {
      Login(
        input: {
          email_password: {
            email: \$email
            password: \$pass
          }
          device_type: Browser
        }
      )
    }
  """;

  static const String sendResetCodeEmail = """
    mutation SendRecoverCodeEmail(\$email: String!) {
      Generate_Code_Email_Recovery_Password(input: \$email) {
        message
        status
      }
    }
  """;

  static const String changePass = """
    mutation ChangePass(\$email: String!, \$password: String!, \$code: Int!) {
      RecoveryPassword(input: {
        email: "\$email",
        password: "\$newpass",
        code: \$code
      }) {
        message
        status
      }
    }
  """;

  static const String createEvent = """
  mutation EventData(\$name: String!, \$description: String!,
      \$startDate: Time!, \$endDate: Time!, \$location: String!, \$isForAdult: Boolean!,
      \$type: Public_Or_Private!, \$image: Upload, \$banner: Upload) {
    CreateEvent(
      input: {
        event_name: \$name,
        description: \$description,
        start_date: \$startDate,
        end_date: \$endDate,
        location: \$location,
        country: "MX",
        categories: boletera,
        is_for_adult: \$isForAdult,
        type: \$type,
        image: \$image,
        image_banner: \$banner
      } )
    }
  """;

  static const String getEvents = """
    query GetEvents {
      GetEvents(input: { input: "", categories: boletera, filters: true }) {
        event_id
        event_name
        description
        start_date
        end_date
        date_register
        location
        country
        currency
        status
        categories
        is_for_adult
        type
        url_image
        image_banner
      }
    }
  """;

  static const String getEventsShop = """
    query GetEvents {
    GetEvents(
        input: { type: Public, filters: true, input: "", categories: boletera }
    ) {
        event_id
        event_name
        description
        start_date
        end_date
        date_register
        location
        country
        currency
        status
        categories
        is_for_adult
        type
        url_image
        image_banner
      }
    }

  """;

  static const String getPhases = """
    query GetPhases(\$id: String!) {
      GetPhases(input: \$id) {
        phase_id
        event_id
        event_name
        phase_name
        start_date
        end_date
        description
        quantity
        price
        status
      }
    }
  """;

  static const String createArea = """
    mutation CreateArea(
      \$event: String!,
      \$area: String!,
      \$status: Status_Close_Open_Cancel!
    ) {
      CreateArea(
        input: { 
          event_name: \$event, 
          event_area_name: \$area, 
          status: \$status 
        }
      ) {
          _dummy
      }
    }
  """;

  static const String createPhase = """
    mutation CreatePhase(\$event: String!, \$phase: String!, \$description: String!, \$start_date: Time!, \$end_date: Time!,
      \$quantity: Int!, \$price: Float!) {
      CreatePhase(
          input: {
            event_name: \$event
            phase_name: \$phase
            description: \$description
            end_date: \$end_date
            quantity: \$quantity
            price: \$price
            start_date: \$start_date
          }
      ) {
        _dummy
      }
    }
  """;

  // Payment Process Stripe
  static const String processPayment = """
  mutation ProcessPayment(\$id: [UUID!]!, \$method: String!, \$discount: String, \$firstname: String!, \$lastname: String!, \$email: String) {
    ProcessPayment(
      input: { 
        phases_id: \$id,
        payment_method: \$method,
        code_discount: \$discount,
        email: \$email,
        name: { 
            last: \$lastname,
            first: \$firstname 
        }
      }
    )
  }
  """;

  static const String emailTicket = """
  mutation CreateSaleTicket(
    \$uuid: UUID!
    \$image: Upload!
    \$places: [String!]
    \$discount: String
    \$sk: String!
    \$email: String
    \$firstName: String!
    \$lastName: String!
  ) {
    CreateSaleTicket(
      input: {
          ticket_id: \$uuid
          image_ticket: \$image
          places: \$places
          code_discount: \$discount
          client_secret: \$sk
          email: \$email
          name: { first: \$firstName, last: \$lastName }
      }
    ) {
      _dummy
    }
  }
  """;
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClients {
  static final HttpLink _usersLink = HttpLink('https://services-dev.novek.life/Users/GraphQL');
  static final HttpLink _novekLink = HttpLink('https://services-dev.novek.life/Novek/GraphQL');

  static final AuthLink _authLink = AuthLink(getToken: () async => 'Bearer ');
  static final Link _link = _authLink.concat(_novekLink);

  static final ValueNotifier<GraphQLClient> authClient =
      ValueNotifier(GraphQLClient(link: _usersLink, cache: GraphQLCache()));
  static final ValueNotifier<GraphQLClient> novekClient =
      ValueNotifier(GraphQLClient(link: _link, cache: GraphQLCache()));

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
    mutation CreateEvent(\$name: String!, \$description: String!, \$startDate: String!, \$endDate: String!, \$location: String!, \$country: String!) {
      CreateEvent(
        input: {
            event_name: "\$name"
            description: "Evento de test"
            start_date: "2024-02-03T09:58:15.872Z"
            end_date: "2024-02-20T09:58:15.872Z"
            location: "Locasion test"
            country: "México"
            categories: 
            is_for_adult: false
            type: Private
        }
    ) {
        _dummy
    }
    }  
  """;
}

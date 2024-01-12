import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClients {
  static final HttpLink _usersLink = HttpLink('https://services.novek.life/Users/GraphQL');
  static final HttpLink _novekLink = HttpLink('https://services.novek.life/Novek/GraphQL');

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
                email: \$email,
                password: \$pass,
            },
            device_type: Android
        }
      ) {
        token
        response {
            message
            status
        }
      }
    }   
  """;

  
}

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
            email: \$email,
            password: \$pass,
          },
          device_type: Browser
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
}

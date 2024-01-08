import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  Future<bool> startSession(String email, String password) async {
    // await _init();
    final HttpLink httpLink = HttpLink(
      'https://services.novek.life/Users/GraphQL',
    );
    final usersClient = GraphQLClient(link: httpLink, cache: GraphQLCache());

    final QueryResult result = await usersClient.query(
      QueryOptions(
        document: gql(
          """query Login {
                Login(
                    input: {
                        email_password: {
                            email: "$email"
                            password: "$password"
                        }
                        device_type: Android
                    }
                ) {
                    token
                    response {
                        message
                        status
                    }
                }
            }""",
        ),
      ),
    );

    if (result.data?['Login']['response']['status'] == 200) {
      final statusCode = result.data?['Login']['response']['status'];
      final message = result.data?['Login']['response']['message'];
      // _responseValidation(result);
      return true;
    }
    // Save an String JWT to be used later
    // _jwt = result.data?['Login']['token'];
    // _authLink = AuthLink(getToken: () async => 'Bearer $_jwt');
    // await _prefs.setString('jwt', result.data?['Login']['token']);

    // isLogedIn = true;

    return false;
  }
}

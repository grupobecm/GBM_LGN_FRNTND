part of 'purchase_cubit.dart';

class PurchaseState extends Equatable {
  final String ticketID;
  final String firstName;
  final String lastName;
  final String email;
  final String secret;

  const PurchaseState({
    required this.ticketID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.secret,
  });

  PurchaseState copyWith({
    String? ticketID,
    String? firstName,
    String? lastName,
    String? email,
    String? secret,
  }) =>
      PurchaseState(
        ticketID: ticketID ?? this.ticketID,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        secret: secret ?? this.secret, //TODO: quitarlo de aqui para que no sea visible en la app
      );

  @override
  List<Object> get props => [ticketID, firstName, lastName, email, secret];
}

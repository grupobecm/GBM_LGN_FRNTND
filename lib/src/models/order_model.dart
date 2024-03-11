class PurchaseOrder {
  final List<String>? phasesID;
  final List<String>? ticketsID;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? secret;

  const PurchaseOrder({
    required this.phasesID,
    required this.ticketsID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.secret,
  });

  PurchaseOrder copyWith({
    List<String>? phasesID,
    List<String>? ticketsID,
    String? firstName,
    String? lastName,
    String? email,
    String? secret,
  }) =>
      PurchaseOrder(
        phasesID: phasesID ?? this.phasesID,
        ticketsID: ticketsID ?? this.ticketsID,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        secret: secret ?? this.secret,
      );
}

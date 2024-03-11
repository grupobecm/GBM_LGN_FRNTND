class EventPhase {
  final int? phaseID;
  final String? name;
  final String? description;
  final String? startDate;
  final String? endDate;
  final int? quantity;
  final double? price;

  const EventPhase({
    required this.phaseID,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.quantity,
    required this.price,
  });

  EventPhase copyWith({
    int? phaseID,
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    int? quantity,
    double? price,
  }) =>
      EventPhase(
        phaseID: phaseID ?? this.phaseID,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );

  factory EventPhase.fromJson(Map<String, dynamic> json) => EventPhase(
        phaseID: 0,
        name: json['phase_name'],
        description: json['description'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        quantity: json['quantity'],
        price: json['price'],
      );
}
class EventArea {
  final int? areaID;
  final String? name;
  final String? status;

  const EventArea({
    required this.areaID,
    required this.name,
    required this.status,
  });

  EventArea copyWith({
    int? areaID,
    String? name,
    String? status,
  }) =>
      EventArea(
        areaID: areaID ?? this.areaID,
        name: name ?? this.name,
        status: status ?? this.status,
      );

  EventArea.fromMap(Map<String, dynamic> map)
      : areaID = map['areaID'],
        name = map['name'],
        status = map['status'];

  factory EventArea.fromJson(Map<String, dynamic> json) => EventArea(
        areaID: json['areaID'],
        name: json['name'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "areaID": areaID,
        "name": name,
        "status": status,
      };
}

enum AreaStatus {
  cancel,
  close,
  open,
}

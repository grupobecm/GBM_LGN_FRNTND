class EventLineup {
  final int? guestID;
  final String? name;
  final String? description;
  final String? urlWeb;
  final String? urlFace;
  final String? urlInsta;
  final String? urlX;
  final dynamic image;

  const EventLineup({
    required this.guestID,
    required this.name,
    required this.description,
    required this.urlWeb,
    required this.urlFace,
    required this.urlInsta,
    required this.urlX,
    required this.image,
  });

  EventLineup copyWith({
    int? guestID,
    String? name,
    String? description,
    String? urlWeb,
    String? urlFace,
    String? urlInsta,
    String? urlX,
    dynamic image,
  }) =>
      EventLineup(
        guestID: guestID ?? this.guestID,
        name: name ?? this.name,
        description: description ?? this.description,
        urlWeb: urlWeb ?? this.urlWeb,
        urlFace: urlFace ?? this.urlFace,
        urlInsta: urlInsta ?? this.urlInsta,
        urlX: urlX ?? this.urlX,
        image: image ?? this.image,
      );
}

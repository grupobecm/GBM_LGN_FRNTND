import 'package:boletera/src/models/area_model.dart';

class Event {
  final int? eventID;
  final String? eventName;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? dateRegister;
  final String? location;
  final String? country;
  final String? status;
  final String? image;
  final String? bannerImage;
  final String? type;
  final bool? isForAdult;
  final List<EventArea>? areas;
  final List<Map<String, String>>? category;

  const Event({
    required this.eventID,
    required this.eventName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.dateRegister,
    required this.location,
    required this.country,
    required this.status,
    required this.image,
    required this.bannerImage,
    required this.type,
    required this.isForAdult,
    required this.areas,
    required this.category,
  });

  Event copyWith({
    final int? eventID,
    final String? eventName,
    final String? description,
    final DateTime? startDate,
    final DateTime? endDate,
    final DateTime? dateRegister,
    final String? location,
    final String? country,
    final String? status,
    final String? image,
    final String? bannerImage,
    final String? type,
    final bool? isForAdult,
    final List<EventArea>? areas,
    final List<Map<String, String>>? category,
  }) =>
      Event(
        eventID: eventID ?? this.eventID,
        eventName: eventName ?? this.eventName,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        dateRegister: dateRegister ?? this.dateRegister,
        location: location ?? this.location,
        country: country ?? this.country,
        status: status ?? this.status,
        image: image ?? this.image,
        bannerImage: bannerImage ?? this.bannerImage,
        type: type ?? this.type,
        isForAdult: isForAdult ?? this.isForAdult,
        areas: areas ?? this.areas,
        category: category ?? this.category,
      );

  Event.fromMap(Map<String, dynamic> map)
      : eventID = map['eventID'],
        eventName = map['eventName'],
        description = map['description'],
        startDate = map['startDate'],
        endDate = map['endDate'],
        dateRegister = map['dateRegister'],
        location = map['location'],
        country = map['country'],
        status = map['status'],
        image = map['image'],
        bannerImage = map['bannerImage'],
        type = map['type'],
        isForAdult = map['isForAdult'],
        areas = map['areas'],
        category = map['category'];

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventID: json['eventID'],
        eventName: json['eventName'],
        description: json['description'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        dateRegister: json['dateRegister'],
        location: json['location'],
        country: json['country'],
        status: json['status'],
        image: json['image'],
        bannerImage: json['bannerImage'],
        type: json['type'],
        isForAdult: json['isForAdult'],
        areas: json['areas'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'eventID': eventID,
        'eventName': eventName,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
        'dateRegister': dateRegister,
        'location': location,
        'country': country,
        'status': status,
        'image': image,
        'bannerImage': bannerImage,
        'type': type,
        'isForAdult': isForAdult,
        'areas': areas,
        'category': category,
      };
}

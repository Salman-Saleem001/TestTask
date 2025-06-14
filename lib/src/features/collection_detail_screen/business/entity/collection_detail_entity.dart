import 'package:flutter/material.dart';

class CollectionDetailEntity{
  late final CollectionDetail _collection;
  CollectionDetail get collection=> _collection;
  CollectionDetailEntity({required CollectionDetail collection}): _collection=collection;
}

class CollectionDetail {
  final String id;
  final String title;
  final String imageUrl;
  final int yearOld;
  final String bottleId;
  final BottleDetails details;
  final TastingNotes tastingNotes;
  final History history;

  CollectionDetail({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.yearOld,
    required this.bottleId,
    required this.details,
    required this.tastingNotes,
    required this.history,
  });

  factory CollectionDetail.fromJson(Map<String, dynamic> json) {
    return CollectionDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      yearOld: json['yearOld'] as int,
      bottleId: json['bottleId'] as String,
      details: BottleDetails.fromJson(json['details'] as Map<String, dynamic>),
      tastingNotes: TastingNotes.fromJson(json['tastingNotes'] as Map<String, dynamic>),
      history: History.fromJson(json['history'] as Map<String, dynamic>),
    );
  }
}

class BottleDetails {
  static const List<String> titles = [
    "Distillery",
    "Region",
    "Country",
    "Type",
    "Age statement",
    "Filled",
    "Bottled",
    "Cask number",
    "ABV",
    "Size",
    "Finish",
  ];

  final String distillery;
  final String region;
  final String country;
  final String type;
  final String ageStatement;
  final String filled;
  final String bottled;
  final String caskNumber;
  final String abv;
  final String size;
  final String finish;

  BottleDetails({
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.ageStatement,
    required this.filled,
    required this.bottled,
    required this.caskNumber,
    required this.abv,
    required this.size,
    required this.finish,
  });

  factory BottleDetails.fromJson(Map<String, dynamic> json) {
    return BottleDetails(
      distillery: json['distillery'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      type: json['type'] as String,
      ageStatement: json['ageStatement'] as String,
      filled: json['filled'] as String,
      bottled: json['bottled'] as String,
      caskNumber: json['caskNumber'] as String,
      abv: json['abv'] as String,
      size: json['size'] as String,
      finish: json['finish'] as String,
    );
  }

  List<String> get values => [
    distillery,
    region,
    country,
    type,
    ageStatement,
    filled,
    bottled,
    caskNumber,
    abv,
    size,
    finish,
  ];
}

class TastingNotes {
  final String author;
  final List<TastingSection> sections;

  TastingNotes({
    required this.author,
    required this.sections,
  });

  factory TastingNotes.fromJson(Map<String, dynamic> json) {
    return TastingNotes(
      author: json['author'] as String,
      sections: (json['sections'] as List)
          .map((item) => TastingSection.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TastingSection {
  final String title;
  final List<String> descriptions;
  final Color sectionColor;

  TastingSection({
    required this.title,
    required this.descriptions,
    this.sectionColor = Colors.amber,
  });

  factory TastingSection.fromJson(Map<String, dynamic> json) {
    return TastingSection(
      title: json['title'] as String,
      descriptions: (json['descriptions'] as List).cast<String>(),
      sectionColor: json['sectionColor'] != null
          ? Color(json['sectionColor'] as int)
          : Colors.amber,
    );
  }
}

class History {
  final String videoUrl;
  final String imageUrl;
  final List<HistoryEvent> events;

  History({
    required this.videoUrl,
    required this.imageUrl,
    required this.events,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      videoUrl: json['videoUrl'] as String,
      imageUrl: json['imageUrl'] as String,
      events: (json['events'] as List)
          .map((item) => HistoryEvent.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class HistoryEvent {
  final DateTime date;
  final String description;
  final String? eventImageUrl;

  HistoryEvent({
    required this.date,
    required this.description,
    this.eventImageUrl,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      eventImageUrl: json['eventImageUrl'] as String?,
    );
  }
}
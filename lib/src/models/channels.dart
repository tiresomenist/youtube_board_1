// To parse this JSON data, do
//
//     final channels = channelsFromJson(jsonString);

import 'dart:convert';

Channels channelsFromJson(String str) => Channels.fromJson(json.decode(str));

String channelsToJson(Channels data) => json.encode(data.toJson());

class Channels {
  Channels({
    this.title,
    this.description,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });

  String? title;
  String? description;
  DateTime? publishedAt;
  Thumbnails? thumbnails;
  Localized? localized;
  String? country;

  factory Channels.fromJson(Map<String, dynamic> json) => Channels(
    title: json["title"],
    description: json["description"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    localized: Localized.fromJson(json["localized"]),
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "publishedAt": publishedAt?.toIso8601String(),
    "thumbnails": thumbnails?.toJson(),
    "localized": localized?.toJson(),
    "country": country,
  };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String? title;
  String? description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault?.toJson(),
    "medium": medium?.toJson(),
    "high": high?.toJson(),
  };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

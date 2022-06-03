// To parse this JSON data, do
//
//     final subscribers = subscribersFromJson(jsonString);

import 'dart:convert';

Subscribers subscribersFromJson(String str) => Subscribers.fromJson(json.decode(str));

String subscribersToJson(Subscribers data) => json.encode(data.toJson());

class Subscribers {
  Subscribers({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  String? viewCount;
  String? subscriberCount;
  bool? hiddenSubscriberCount;
  String? videoCount;

  factory Subscribers.fromJson(Map<String, dynamic> json) => Subscribers(
    viewCount: json["viewCount"],
    subscriberCount: json["subscriberCount"],
    hiddenSubscriberCount: json["hiddenSubscriberCount"],
    videoCount: json["videoCount"],
  );

  Map<String, dynamic> toJson() => {
    "viewCount": viewCount,
    "subscriberCount": subscriberCount,
    "hiddenSubscriberCount": hiddenSubscriberCount,
    "videoCount": videoCount,
  };
}

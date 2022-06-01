// To parse this JSON data, do
//
//     final liveStreamingDetail = liveStreamingDetailFromJson(jsonString);

import 'dart:convert';

LiveStreamingDetail liveStreamingDetailFromJson(String str) => LiveStreamingDetail.fromJson(json.decode(str));

String liveStreamingDetailToJson(LiveStreamingDetail data) => json.encode(data.toJson());

class LiveStreamingDetail {
  LiveStreamingDetail({
    this.actualStartTime,
    this.scheduledStartTime,
    this.concurrentViewers,
  });

  DateTime? actualStartTime;
  DateTime? scheduledStartTime;
  String? concurrentViewers;

  factory LiveStreamingDetail.fromJson(Map<String, dynamic> json) => LiveStreamingDetail(
    actualStartTime: DateTime.parse(json["actualStartTime"]),
    scheduledStartTime: DateTime.parse(json["scheduledStartTime"]),
    concurrentViewers: json["concurrentViewers"],
  );

  Map<String, dynamic> toJson() => {
    "actualStartTime": actualStartTime?.toIso8601String(),
    "scheduledStartTime": scheduledStartTime?.toIso8601String(),
    "concurrentViewers": concurrentViewers,
  };
}

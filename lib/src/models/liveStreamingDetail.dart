// To parse this JSON data, do
//
//     final liveStreamingDetail = liveStreamingDetailFromJson(jsonString);

import 'dart:convert';

LiveStreamingDetail liveStreamingDetailFromJson(String str) => LiveStreamingDetail.fromJson(json.decode(str));

String liveStreamingDetailToJson(LiveStreamingDetail data) => json.encode(data.toJson());

class LiveStreamingDetail {
  LiveStreamingDetail({
    this.concurrentViewers,
  });

  String? concurrentViewers;

  factory LiveStreamingDetail.fromJson(Map<String, dynamic> json) => LiveStreamingDetail(
    concurrentViewers: json["concurrentViewers"],
  );

  Map<String, dynamic> toJson() => {
    "concurrentViewers": concurrentViewers,
  };
}

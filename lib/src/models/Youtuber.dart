import '../models/channels.dart';
import '../models/subscribers.dart';
class Youtuber{

  Youtuber({
   this.snippet,
   this.statistics,
  });
  Channels? snippet;
  Subscribers? statistics;
  factory Youtuber.fromJson(Map<String,dynamic> json)=>
      Youtuber(
          snippet: Channels.fromJson(json["snippet"]),
          statistics: Subscribers.fromJson(json["statistics"]),
      );
}
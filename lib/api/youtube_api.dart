import 'dart:convert';
import 'package:http/http.dart';

class YoutubeApi {
  Future<String> getYoutubeTitle(String videoUrl) async {
    final response = await get(Uri.parse("https://www.youtube.com/oembed?url=$videoUrl&format=json"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String title = data['title'];
      return title;
    } else {
      throw Exception("Failed to fetch video title");
    }
  }
}

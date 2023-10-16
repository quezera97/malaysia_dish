import 'dart:convert';
import 'package:http/http.dart';

class YoutubeApi {
  Future<Map<String, dynamic>> getYoutubeDetails(String videoUrl) async {
    final response = await get(
        Uri.parse("https://www.youtube.com/oembed?url=$videoUrl&format=json"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final videoDetails = {
        'title': data['title'],
        'thumbnailUrl': data['thumbnail_url'],
        'authorName': data['author_name'],
      };

      return videoDetails;
    } else {
      throw Exception("Failed to fetch video response");
    }
  }
}

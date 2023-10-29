import 'dart:convert';
import 'package:absolute_stay/server/model/profile_model.dart';
import 'package:absolute_stay/server/server_url.dart';
import 'package:http/http.dart'as http;
class serverClint{

 static Future<Map<String, dynamic>> fetchData(url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  static Future<Map<String, dynamic>> postData( Map<String, dynamic> params,url) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(params),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data: ${response.reasonPhrase}');
    }
  }
  }
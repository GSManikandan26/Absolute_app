import 'dart:convert';
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

static Future<Map<String, dynamic>> postData(Map<String, dynamic> params, String url) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(params),
  );
print(jsonEncode(params));
  if (response.statusCode == 200||response.statusCode == 201) {
    return {
      
      'status': 'success',
      'message': 'Request was successful',
      'data': json.decode(response.body),
    };
  } else {
    return {
      'status': 'error',
      'message': 'Failed to post data: ${response.reasonPhrase}',
    };
  }
}

  }
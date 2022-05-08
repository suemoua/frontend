import 'package:http/http.dart' as http;
class HttpApi {
  // Method post
  static Future<http.Response?> post(String url,
      {required Map<String, dynamic> body}) async {
    final u = 'http://192.168.112.71:8007/$url';
    final uri = Uri.parse(u);
    try {
      final response = await http.post(uri, body: body);
      print('HTTP RESPONSE STATUS: ${response.statusCode}');
      print('HTTP RESPONSE: ${response.body}');

      return response;
    } catch (err) {
      print(err);
    }
    return null;
  }
  // Method get
  static Future<http.Response?> get(String url) async {
    final u = 'http://192.168.1.79:8007/$url';
    final uri = Uri.parse(u);
    try {
      final response = await http.get(uri);
      print('HTTP RESPONSE STATUS: ${response.statusCode}');
      print('HTTP RESPONSE: ${response.body}');

      return response;
    } catch (err) {
      print(err);
    }
    return null;
  }
}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000";

  static Future<List<dynamic>> searchFace(File file) async {
    final req = http.MultipartRequest("POST", Uri.parse("$baseUrl/search"));
    req.fields['user_id'] = "query";
    req.files.add(await http.MultipartFile.fromPath("file", file.path));
    final res = await req.send();
    if (res.statusCode == 200) {
      final s = await res.stream.bytesToString();
      return (json.decode(s)["matches"] as List<dynamic>);
    }
    return [];
  }
}

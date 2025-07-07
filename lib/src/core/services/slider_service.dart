import 'dart:convert';
import 'package:http/http.dart' as http;

class SliderService {
  static Future<List<String>> fetchSliderImages() async {
    final response = await http.get(
      Uri.parse('https://decor.up.railway.app/slider/'), // ← الصحيح هنا
    );

    print("Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = json.decode(response.body);
      final List<dynamic> data = jsonBody['data'];

      return data.map<String>((item) => item['image'] as String).toList();
    } else {
      throw Exception('Failed to load slider images');
    }
  }
}

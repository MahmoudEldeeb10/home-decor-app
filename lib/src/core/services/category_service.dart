import 'dart:convert';
import 'package:home_decor/src/features/models/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://decor.up.railway.app/categories/'));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List data = jsonBody['data'];

      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

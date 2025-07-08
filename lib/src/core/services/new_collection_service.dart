import 'dart:convert';
import 'package:home_decor/src/features/models/new_collection_model.dart';
import 'package:http/http.dart' as http;

class NewCollectionService {
  static Future<List<NewCollectionModel>> fetchNewCollection() async {
    final response = await http.get(
      Uri.parse('https://decor.up.railway.app/new/'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List items = jsonData['data'];
      return items.map((e) => NewCollectionModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load new collection');
    }
  }
}

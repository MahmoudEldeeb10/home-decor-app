import 'dart:convert';
import 'package:home_decor/src/features/models/best_seller_model.dart';
import 'package:http/http.dart' as http;

class BestSellerService {
  static Future<List<BestSellerModel>> fetchBestSellers() async {
    final response = await http.get(
      Uri.parse('https://decor.up.railway.app/best-seller/'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List items = data['data'];
      return items.map((e) => BestSellerModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load best sellers');
    }
  }
}

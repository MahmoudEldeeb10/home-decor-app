import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();
  final String baseUrl = 'https://decor.up.railway.app';

  // ✅ LOGIN
  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login/',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final token = response.data['access'];
      await _storage.write(key: 'access_token', value: token);
      await _storage.write(
        key: 'refresh_token',
        value: response.data['refresh'],
      );

      return token;
    } on DioException catch (e) {
      print('❌ Login Error: ${e.response?.data}');
      throw Exception('Login failed: ${e.response?.data}');
    }
  }

  // ✅ REGISTER (signup)
  Future<String> register(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '$baseUrl/register/',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final token = response.data['access_token'];
      await _storage.write(key: 'access_token', value: token);
      await _storage.write(
        key: 'refresh_token',
        value: response.data['refresh_token'],
      );

      return token;
    } on DioException catch (e) {
      print('❌ Register Error: ${e.response?.data}');
      throw Exception('Registration failed: ${e.response?.data}');
    }
  }

  // ✅ LOGOUT
  Future<void> logout() async {
    try {
      final accessToken = await _storage.read(key: 'access_token');

      await _dio.post(
        '$baseUrl/logout/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
    } on DioException catch (e) {
      print('❌ Logout Error: ${e.response?.data}');
      throw Exception('Logout failed: ${e.response?.data}');
    }
  }
}

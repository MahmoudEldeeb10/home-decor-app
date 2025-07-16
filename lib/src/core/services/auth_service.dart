import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  final String baseUrl = 'https://decor.up.railway.app';

  Future<String> login(String email, String password) async {
    final response = await _dio.post(
      '$baseUrl/login/',
      data: {
        'email': email,
        'password': password,
      },
    );

    final token = response.data['access'];
    await _storage.write(key: 'access_token', value: token);
    await _storage.write(key: 'refresh_token', value: response.data['refresh']);
    return token;
  }

  Future<String> register(
    String username,
    String email,
    String password,
  ) async {
    final response = await _dio.post(
      '$baseUrl/register/',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    final token = response.data['access_token'];
    await _storage.write(key: 'access_token', value: token);
    await _storage.write(
      key: 'refresh_token',
      value: response.data['refresh_token'],
    );
    return token;
  }
}

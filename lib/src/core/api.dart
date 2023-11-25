import 'package:base_auth_app/src/core/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Api class
///
/// This class is used to make http request to the api
class Api {
  // Init dio
  final _dio = Dio(
    BaseOptions(
      // Get api url from .env file
      baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000',
    ),
  );

  /// Get headers
  final _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${getValue('token')}',
  };

  /// Get method
  ///
  /// This method is used to make a get request to the api
  ///
  /// [path] is [String] type and is the path of the api
  ///
  /// Example:
  /// ```dart
  /// get('/users');
  /// ```
  Future<Response> get(String path) async {
    return await _dio.get(path, options: Options(headers: _headers));
  }

  /// Post method
  ///
  /// This method is used to make a post request to the api
  ///
  /// [path] is [String] type and is the path of the api
  /// [data] is [Map<String, dynamic>] type and is the data to be sent to the api
  ///
  /// Example:
  /// ```dart
  /// post('/users', {
  ///   'name': 'John Doe',
  ///   'email': 'john.doe@example',
  ///   'password': 'password',
  /// });
  /// ```
  Future<Response> post(String path, Map<String, dynamic> data) async {
    print(_headers.toString());
    print(data.toString());
    return await _dio.post(path,
        data: data, options: Options(headers: _headers));
  }

  /// Put method
  ///
  /// This method is used to make a put request to the api
  ///
  /// [path] is [String] type and is the path of the api
  /// [data] is [Map<String, dynamic>] type and is the data to be sent to the api
  ///
  /// Example:
  /// ```dart
  /// put('/users/1', {
  ///   'name': 'John Doe',
  ///   'email': 'john.doe@example',
  ///   'password': 'password',
  /// });
  /// ```
  Future<Response> put(String path, Map<String, dynamic> data) async {
    return await _dio.put(path,
        data: data, options: Options(headers: _headers));
  }

  /// Delete method
  ///
  /// This method is used to make a delete request to the api
  ///
  /// [path] is [String] type and is the path of the api
  ///
  /// Example:
  /// ```dart
  /// delete('/users/1');
  /// ```
  Future<Response> delete(String path) async {
    return await _dio.delete(path, options: Options(headers: _headers));
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/constants.dart';

class DreamService {
  final Dio _dio = Dio();

  Future<Response?> getDreamData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$dreams');
      return response;
    } catch (err) {
      log("Error: $err");
    }
    return null;
  }
}

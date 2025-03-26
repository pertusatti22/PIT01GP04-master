import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pit01gp04/src/utils/constants.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<Response?> getHomeData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$bill');
      return response;
    } catch (err) {
      log('Error: $err');
    }
    return null;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/constants.dart';

class AccountService {
  final Dio _dio = Dio();

  Future<Response?> getAccountsData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$accounts');
      return response;
    } catch (err) {
      log("Error: $err");
    }
    return null;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/constants.dart';

class ExpenseService {
  final Dio _dio = Dio();

  Future<Response?> getExpenseData() async {
    try {
      final Response response = await _dio.get('$baseUrl/$expenses');
      return response;
    } catch (err) {
      log("Error: $err");
    }
    return null;
  }
}

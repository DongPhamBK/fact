import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final factServiceProvider = Provider((ref) => FactService());

class FactService {
  final Dio _dio = Dio();

  Future<String> getFact() async {
    try {
      //Each call to this API will return a different data
      Response? response = await _dio.get("https://uselessfacts.jsph.pl/api/v2/facts/random?language=en");
      return response.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:dio/dio.dart';

class CacheHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://gold-golio.herokuapp.com/",
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }

  /// Post_Data
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(url, data: data);
  }
}

import 'package:dio/dio.dart';
import 'package:lettutor/utils/exepctions.dart';

class ApiProvider {
  Dio api = Dio();

  ApiProvider(String baseUrl) {
    api.options.baseUrl = baseUrl;
  }

  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.post(url,
          options: Options(headers: headers, contentType: contentType),
          data: data,
          queryParameters: queryParams,
          cancelToken: cancelToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (err) {
      throw CustomException(err.response?.data["message"]);
    }
  }

  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.get(url,
          options: Options(headers: headers, contentType: contentType),
          data: data,
          queryParameters: queryParams,
          cancelToken: cancelToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (err) {
      throw CustomException(err.response?.data["message"]);
    }
  }
}

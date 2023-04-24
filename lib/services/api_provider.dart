import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/utils/exepctions.dart';
import 'package:lettutor/utils/secured_local_storage.dart';

class ApiProvider {
  Dio api = Dio();
  String? accessToken;
  final SecuredLocalStorage _storage = SecuredLocalStorage();

  ApiProvider(String baseUrl) {
    api.options.baseUrl = baseUrl;

    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      accessToken = await _storage.readString(KEY_CONST.ACCESS_TOKEN_KEY);

      if (accessToken == null || JwtDecoder.isExpired(accessToken!)) {
        return handler.next(options);
      }

      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      //only run if access Token expired or invalid.
      if (error.response?.statusCode == 401 &&
          error.response?.data["message"] == "Please authenticate") {
        String? refreshToken =
            await _storage.readString(KEY_CONST.REFRESH_TOKEN_KEY);

        if (refreshToken != null) {
          if (await refreshTokenApi(refreshToken)) {
            //success get new access token retry a request
            return handler.resolve(await _retry(error.requestOptions));
          }
        }
      }
      return handler.next(error);
    }));
  }

  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Object? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.post(url,
          options: Options(
              headers: headers,
              contentType: contentType,
              receiveTimeout: const Duration(seconds: 10)),
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

  Future<dynamic> put(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Object? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.put(url,
          options: Options(
              headers: headers,
              contentType: contentType,
              receiveTimeout: const Duration(seconds: 10)),
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

  Future<dynamic> delete(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Object? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.delete(url,
          options: Options(
              headers: headers,
              contentType: contentType,
              receiveTimeout: const Duration(seconds: 10)),
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

  Future<bool> refreshTokenApi(String refreshToken) async {
    try {
      final response = await Dio().post(
          "${UrlConst.baseUrl}/auth/refresh-token",
          options: Options(
              contentType: Headers.jsonContentType,
              receiveTimeout: const Duration(seconds: 10)),
          data: {'refreshToken': refreshToken});
      if (response.statusCode == 200) {
        //get new access token
        accessToken = response.data["tokens"]["access"]["token"];
        await _storage.saveString(KEY_CONST.ACCESS_TOKEN_KEY, accessToken!);
        await _storage.saveString(KEY_CONST.REFRESH_TOKEN_KEY,
            response.data["tokens"]["refresh"]["token"]);
        return true;
      } else {
        //invalid refresh token
        accessToken = null;
        _storage.deleteAll();
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}

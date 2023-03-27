import 'package:dio/dio.dart';
import 'package:lettutor/services/api_provider.dart';

abstract class BaseRepository {
  late CancelToken cancelToken;
  late ApiProvider apiProvider;
  BaseRepository(String baseUrl) {
    apiProvider = ApiProvider(baseUrl);
    cancelToken = CancelToken();
  }
}

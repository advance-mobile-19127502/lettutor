import 'package:dio/dio.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.baseUrl);

  Future<AccountInfo> register(String email, String password) async {
    try {
      final response = await apiProvider.post(
          url: "/register",
          contentType: Headers.formUrlEncodedContentType,
          data: {"email": email, "password": password});
      return AccountInfo.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  Future<AccountInfo> login(String email, String password) async {
    try {
      final response = await apiProvider.post(
          url: "/login",
          contentType: Headers.jsonContentType,
          data: {"email": email, "password": password});
      return AccountInfo.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}

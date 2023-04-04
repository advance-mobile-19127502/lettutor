import 'package:dio/dio.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.baseUrl);

  Future<void> forgotPassword(String email) async {
    try {
      final response = await apiProvider.post(
          url: "/forgotPassword",
          contentType: Headers.jsonContentType,
          data: {"email": email});
    } catch (err) {
      rethrow;
    }
  }

  Future<void> manageFavoriteTutor(String tutorId) async {
    try {
      await apiProvider
          .post(url: "/manageFavoriteTutor", data: {"tutorId": tutorId});
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<AccountInfo> getAccountInfo() async {
    try {
      final response = await apiProvider.get(url: "/info");
      return AccountInfo.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}

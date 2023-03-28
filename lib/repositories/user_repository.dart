import 'package:dio/dio.dart';
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
}

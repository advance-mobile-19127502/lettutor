import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/models/from_api/token.dart';
import 'package:lettutor/repositories/base_repository.dart';
import 'package:lettutor/utils/secured_local_storage.dart';
import 'package:flutter/services.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.baseUrl);
  String? accessToken;
  String? refreshToken;

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

      AccountInfo tempAccountInfo = AccountInfo.fromJson(response);
      accessToken = tempAccountInfo.tokens?.access?.token;
      refreshToken = tempAccountInfo.tokens?.refresh?.token;

      SecuredLocalStorage _storage = SecuredLocalStorage();
      await _storage.saveString(KEY_CONST.ACCESS_TOKEN_KEY, accessToken!);
      await _storage.saveString(KEY_CONST.REFRESH_TOKEN_KEY, refreshToken!);

      return tempAccountInfo;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> checkAuthentication(
      String? accessTokenFromStorage, String? refreshTokenFromStorage) async {
    try {
      if (accessTokenFromStorage != null &&
          !JwtDecoder.isExpired(accessTokenFromStorage)) {
        accessToken = accessTokenFromStorage;
        refreshToken = refreshTokenFromStorage;
      } else {
        if (refreshTokenFromStorage != null) {
          Clipboard.setData(ClipboardData(text: refreshTokenFromStorage));
          final response = await apiProvider.post(
              url: "/refresh-token",
              contentType: Headers.jsonContentType,
              data: {'refreshToken': refreshTokenFromStorage});

          accessToken = Token.fromJson(response["tokens"]["access"]).token;
          refreshToken = Token.fromJson(response["tokens"]["refresh"]).token;
        }
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}

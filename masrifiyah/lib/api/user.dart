import 'dart:convert';
import 'dart:io' as io;
import 'package:http/http.dart';
import 'base.dart';

class UserAPI extends BaseAPI {
  static var loginAPI = BaseAPI.getAPI("login");
  static var signinAPI = BaseAPI.getAPI("signin");

  Future<Response> login(
    String email,
    String password,
  ) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    Response response = await super.post(loginAPI, body);
    return response;
  }

  Future<Response> signIn(
    String username,
    String email,
    String password,
  ) async {
    var body = jsonEncode({
      'name': username,
      'email': email,
      'password': password,
    });
    Response response = await super.post(signinAPI, body);
    return response;
  }
}

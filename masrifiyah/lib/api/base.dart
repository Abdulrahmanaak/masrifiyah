import 'dart:io';
import 'package:http/http.dart' as http;
import '/config/settings.dart';

class BaseAPI {
  static Uri getAPI(String path) {
    return Uri.parse("$REQUEST_SCHEMA://$API_HOST/$API_PATH/$path/");
  }

  Future<http.Response> post(Uri api, [Object? body]) async {
    var requestHeaders = await headers();
    http.Response response =
        await http.post(api, headers: requestHeaders, body: body);
    return response;
  }

  Future<http.Response> get(Uri api, {Map<String, String>? queryParams}) async {
    var requestHeaders = await headers();
    if (queryParams != null && queryParams.isNotEmpty) {
      api = api.replace(queryParameters: queryParams);
    }
    http.Response response = await http.get(api, headers: requestHeaders);
    return response;
  }

  Future<Map<String, String>> headers() async {
    var headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
      "Accept-Language": "en",
      "User-Agent":
          "MawqootApp/$APP_VERSION (${Platform.operatingSystem}/${Platform.operatingSystemVersion}; ${Platform.localHostname}) Dart/${Platform.version}"
    };
    return headers;
  }
}

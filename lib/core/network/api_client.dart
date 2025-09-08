import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  static late String baseUrl;
  static String apiKey = "*********************************";

  ApiClient._internal() {
    baseUrl = "https://finnhub.io/api/v1";
  }

  factory ApiClient() {
    return ApiClient._internal();
  }

  static Uri getUrl({required String endpoint, String? query}) => Uri.parse(
    "$baseUrl$endpoint"
    "?$query"
    "&token=$apiKey",
  );

  dynamic getRequest({required String endPoint, String? query}) async {
    try {
      http.Response response = await http.get(
        getUrl(endpoint: endPoint, query: query),
      );
      log("getRequest : $endPoint");
      log("Response: ${response.body} \n status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 404) {
        return http.Response("Data not found", 404);
      } else {
        return http.Response("Internal Server error", 500);
      }
    } on SocketException {
      log("SocketException : Please check internet connection");
      return http.Response("Please check internet connection", 503);
    } catch (e) {
      log("Exception : $e");
      return http.Response("Something went wrong try again", 500);
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stock_quote/core/constants/enums.dart';
import '../../env.dart';

class ApiClient {
  static late String baseUrl;
  static String apiKeyFinnHub = Env.apiKeyFinnHub;
  static String apiKeyAlphaVantage = Env.apiKeyAlphaVantage;

  ApiClient._internal({required ApiUse apiUse}) {
    if (apiUse == ApiUse.finnHub) {
      baseUrl = "https://finnhub.io/api/v1";
    } else {
      baseUrl = "https://www.alphavantage.co";
    }
  }

  factory ApiClient({required ApiUse apiUse}) {
    return ApiClient._internal(apiUse: apiUse);
  }

  static Uri getUrlFinnHub({required String endpoint, String? query}) =>
      Uri.parse(
        "$baseUrl$endpoint"
        "?$query"
        "&token=$apiKeyFinnHub",
      );

  static Uri getUrlAlphaVantage({required String endpoint, String? query}) =>
      Uri.parse(
        "$baseUrl$endpoint"
        "?$query"
        "&apikey=$apiKeyAlphaVantage",
      );

  static Uri getUrl({
    required ApiUse apiUse,
    required String endpoint,
    String? query,
  }) {
    if (apiUse == ApiUse.finnHub) {
      return getUrlFinnHub(endpoint: endpoint, query: query);
    } else {
      return getUrlAlphaVantage(endpoint: endpoint, query: query);
    }
  }

  dynamic getRequest({
    required String endPoint,
    String? query,
    ApiUse? apiUse = ApiUse.finnHub,
  }) async {
    try {
      Uri url = getUrl(apiUse: apiUse!, endpoint: endPoint, query: query);

      http.Response response = await http.get(url);
      log("getRequest : $endPoint");
      log("Response: ${response.body} \n status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 404) {
        return http.Response("Data not found", 404);
      } else if (response.statusCode == 403) {
        return http.Response("We don't have access to this resource", 404);
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

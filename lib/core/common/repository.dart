import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../network/api_client.dart';
import 'common_snack_bar.dart';

class Repository {
  static dynamic getMethod({required String endPoint, String? query}) async {
    try {
      final response =
          await ApiClient().getRequest(endPoint: endPoint, query: query)
              as http.Response;
      if (response.statusCode == 200) {
        return await json.decode(response.body);
      } else {
        showCommonSnackBar(
          message: response.body,
          snackBarType: SnackBarType.failure,
        );
        return null;
      }
    } on SocketException {
      showCommonSnackBar(
        message: "Please check internet connection",
        snackBarType: SnackBarType.failure,
      );
      return null;
    } catch (e) {
      showCommonSnackBar(
        message: "Something went wrong",
        snackBarType: SnackBarType.failure,
      );
      return null;
    }
  }
}

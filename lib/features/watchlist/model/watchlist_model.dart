import 'package:stock_quote/core/constants/constants.dart';

class WatchlistModel {
  WatchlistModel({
    required this.companySymbol,
    required this.companyDescription,
  });

  String companySymbol;
  String companyDescription;

  factory WatchlistModel.fromJson(Map<String, dynamic> data) {
    return WatchlistModel(
      companySymbol: data[symbolKey],
      companyDescription: data[descriptionKey],
    );
  }
}

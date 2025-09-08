import 'package:stock_quote/core/constants/constants.dart';

class RecentlyViewedStockModel {
  RecentlyViewedStockModel({
    required this.companyName,
    required this.companySymbol,
    required this.todaysCurrentPrice,
    required this.changeInPrice,
    required this.changePercent,
    required this.todaysHighPrice,
    required this.todaysLowPrice,
    required this.openingPrice,
    required this.previousClosedPrice,
    required this.dataTiming,
  });

  final String companyName;
  final String companySymbol;
  final double todaysCurrentPrice;
  final double changeInPrice;
  final double changePercent;
  final double todaysHighPrice;
  final double todaysLowPrice;
  final double openingPrice;
  final double previousClosedPrice;
  final String dataTiming;

  factory RecentlyViewedStockModel.fromJson(Map<String, dynamic> json) {
    return RecentlyViewedStockModel(
      companyName: json[descriptionKey],
      companySymbol: json[symbolKey],
      todaysCurrentPrice: json[currentPrice],
      changeInPrice: json[changedPrice],
      changePercent: json[changeInPercentage],
      todaysHighPrice: json[todaysHigh],
      todaysLowPrice: json[todaysLow],
      openingPrice: json[openedPrice],
      previousClosedPrice: json[previousClose],
      dataTiming: json[dateTime],
    );
  }
}

class StockQuoteModel {
  StockQuoteModel({
    required this.currentPrice,
    required this.changeInPrice,
    required this.changePercent,
    required this.openingPrice,
    required this.previousClose,
    required this.todaysHigh,
    required this.todaysLow,
    required this.dataTiming,
  });

  final double currentPrice;
  final double changeInPrice;
  final double changePercent;
  final double todaysHigh;
  final double todaysLow;
  final double openingPrice;
  final double previousClose;
  final String dataTiming;

  factory StockQuoteModel.fromJson(Map<String, dynamic> json) {
    var epochTimeStamp = json["t"];
    DateTime date = DateTime.fromMillisecondsSinceEpoch(epochTimeStamp);

    return StockQuoteModel(
      currentPrice: json["c"] * 1.0,
      changeInPrice: json["d"] * 1.0,
      changePercent: json["dp"] * 1.0,
      openingPrice: json["h"] * 1.0,
      previousClose: json["l"] * 1.0,
      todaysHigh: json["o"] * 1.0,
      todaysLow: json["pc"] * 1.0,
      dataTiming: date.toString(),
    );
  }
}

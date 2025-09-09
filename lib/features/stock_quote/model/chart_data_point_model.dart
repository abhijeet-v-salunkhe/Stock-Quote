class ChartDataPointModel {
  ChartDataPointModel({required this.date, required this.close});

  final DateTime date;
  final double close;

  factory ChartDataPointModel.fromJson({
    required String key,
    required dynamic data,
  }) {
    DateTime date = DateTime.parse(key);
    double closeValue = double.parse(data["4. close"]);
    return ChartDataPointModel(date: date, close: closeValue);
  }
}

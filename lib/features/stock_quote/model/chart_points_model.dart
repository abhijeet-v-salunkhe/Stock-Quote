import 'dart:developer';

import 'package:stock_quote/features/stock_quote/model/chart_data_point_model.dart';

class ChartPointsModel {
  ChartPointsModel({required this.dataPointList});

  List<ChartDataPointModel> dataPointList;

  static List<ChartDataPointModel> getList({required dynamic value}) {
    List<ChartDataPointModel> list = [];
    for (var data in value.entries) {
      list.add(ChartDataPointModel.fromJson(key: data.key, data: data.value));
    }

    list.sort((a, b) => a.date.compareTo(b.date));

    return list;
  }

  factory ChartPointsModel.fromJson(dynamic jsonData) {
    List<ChartDataPointModel> list = getList(value: jsonData);
    return ChartPointsModel(dataPointList: list);
  }
}

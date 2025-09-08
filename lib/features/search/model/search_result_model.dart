import 'package:stock_quote/features/search/model/searched_company_model.dart';

class SearchResultModel {
  SearchResultModel({required this.count, required this.result});

  int count;
  List<SearchedCompanyModel> result;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      count: json["count"],
      result: listOfCompanies(json["result"]),
    );
  }

  static List<SearchedCompanyModel> listOfCompanies(List<dynamic> data) =>
      data.map((e) => SearchedCompanyModel.fromJson(e)).toList();
}

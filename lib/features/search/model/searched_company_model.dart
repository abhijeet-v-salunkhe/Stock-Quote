class SearchedCompanyModel {
  SearchedCompanyModel({
    required this.description,
    required this.displaySymbol,
    required this.symbol,
    required this.type,
  });

  String description;
  String displaySymbol;
  String symbol;
  String type;

  factory SearchedCompanyModel.fromJson(Map<String, dynamic> json) {
    return SearchedCompanyModel(
      description: json["description"],
      displaySymbol: json["displaySymbol"],
      symbol: json["symbol"],
      type: json["type"],
    );
  }
}

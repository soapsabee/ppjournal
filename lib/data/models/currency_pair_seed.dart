class CurrencyPairSeed {
  final String name;
  final String detail;

  CurrencyPairSeed({required this.name, required this.detail});

  factory CurrencyPairSeed.fromJson(Map<String, dynamic> json) {
    return CurrencyPairSeed(
      name: json['name'],
      detail: json['detail'],
    );
  }
}
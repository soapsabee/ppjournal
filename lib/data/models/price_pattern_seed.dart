class PricePatternSeed {
  final String name;
  final String detail;

  PricePatternSeed({required this.name, required this.detail});

  factory PricePatternSeed.fromJson(Map<String, dynamic> json) {
    return PricePatternSeed(name: json['name'], detail: json['detail']);
  }
}

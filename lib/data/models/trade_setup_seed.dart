class TradeSetupSeed {
  final String name;
  final String detail;

  TradeSetupSeed({required this.name, required this.detail});

  factory TradeSetupSeed.fromJson(Map<String, dynamic> json) {
    return TradeSetupSeed(
      name: json['name'],
      detail: json['detail'],
    );
  }
}
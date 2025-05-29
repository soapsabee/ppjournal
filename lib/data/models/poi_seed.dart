class PoiSeed {
  final String name;
  final String detail;

  PoiSeed({required this.name, required this.detail});

  factory PoiSeed.fromJson(Map<String, dynamic> json) {
    return PoiSeed(
      name: json['name'],
      detail: json['detail'],
    );
  }
}
class SignalSeed {
   final String name;
  final String detail;

  SignalSeed({required this.name, required this.detail});

  factory SignalSeed.fromJson(Map<String, dynamic> json) {
    return SignalSeed(name: json['name'], detail: json['detail']);
  }
}
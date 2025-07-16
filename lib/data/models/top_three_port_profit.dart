class TopThreePortProfit {
  final String portName;
  final double profit;

  TopThreePortProfit({
    required this.portName,
    required this.profit,
  });

  factory TopThreePortProfit.fromJson(Map<String, dynamic> json) {
    return TopThreePortProfit(
      portName: json['port_name'] as String,
      profit: (json['profit'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'port_name': portName,
      'profit': profit,
    };
  }
}
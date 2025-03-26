class Bill {
  final int userId;
  final DateTime date;
  final String name;
  final double total;

  const Bill({
    required this.userId,
    required this.date,
    required this.name,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date,
      'name': name,
      'total': total,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      userId: map['userId'] as int,
      date: DateTime.parse(map['date']),
      name: map['name'] as String,
      total: map['total'] as double,
    );
  }
}

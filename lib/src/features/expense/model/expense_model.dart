class Expense {
  final int userId;
  final String category;
  final double total;

  const Expense({
    required this.userId,
    required this.category,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'category': category,
      'total': total,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      userId: map['userId'] as int,
      category: map['category'] as String,
      total: map['total'] as double,
    );
  }
}

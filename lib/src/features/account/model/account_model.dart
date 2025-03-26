class Account {
  final int userId;
  final String title;
  final double balance;

  const Account({
    required this.userId,
    required this.title,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'balance': balance,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      userId: map['userId'] as int,
      title: map['title'] as String,
      balance: map['balance'] as double,
    );
  }
}

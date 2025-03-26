class Dream {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  final DateTime dueDate;
  final double price;

  const Dream({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
    required this.dueDate,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
      'dueDate': dueDate,
      'price': price,
    };
  }

  factory Dream.fromMap(Map<String, dynamic> map) {
    return Dream(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
      dueDate: DateTime.parse(map['dueDate']),
      price: map['price'] as double,
    );
  }
}

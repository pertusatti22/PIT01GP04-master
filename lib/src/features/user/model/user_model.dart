import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;

  const UserModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    UserModel user = UserModel(
      id: snap.id,
      name: snap['name'],
    );
    return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

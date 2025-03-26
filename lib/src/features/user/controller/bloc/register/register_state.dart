part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final UserModel user;

  const RegisterLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

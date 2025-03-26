part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class StartRegister extends RegisterEvent {
  final UserModel user;

  const StartRegister(
      {this.user = const UserModel(
        id: '',
        name: '',
      )});

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends RegisterEvent {
  final UserModel user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

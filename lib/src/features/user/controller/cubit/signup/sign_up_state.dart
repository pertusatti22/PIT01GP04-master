part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String email;
  final String password;
  final SignUpStatus status;
  final auth.User? user;

  bool get isEmailValid =>
      email.length > 7 && email.contains('@') && email.contains('.com');

  bool get isPasswordValid => password.length > 5;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const SignUpState({
    required this.email,
    required this.password,
    required this.status,
    this.user,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      email: '',
      password: '',
      status: SignUpStatus.initial,
      user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password, status, user];

  SignUpState copyWith({
    String? email,
    String? password,
    SignUpStatus? status,
    auth.User? user,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

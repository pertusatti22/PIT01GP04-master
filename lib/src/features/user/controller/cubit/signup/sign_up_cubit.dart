import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../repository/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignUpState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignUpStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignUpStatus.initial));
  }

  bool? passwordValidate(String value) {
    if (state.password == value) {
      emit(state.copyWith(status: SignUpStatus.submitting));
      return true;
    }
    return false;
  }

  Future<void> signUpWithCredentials() async {
    try {
      var user = await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: SignUpStatus.success, user: user));
    } catch (_) {}
  }

  Future<SignUpState?> logOut() async {
    try {
      await _authRepository.signOut();
      return SignUpState.initial();
    } catch (_) {}
    return null;
  }
}

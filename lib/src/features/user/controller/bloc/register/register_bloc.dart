import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/user_model.dart';
import '../../../repository/database_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final DatabaseRepository _databaseRepository;

  RegisterBloc({
    required DatabaseRepository databaseRepository,
  })  : _databaseRepository = databaseRepository,
        super(RegisterLoading()) {
    on<StartRegister>(_onStartRegister);
    on<UpdateUser>(_onUpdateUser);
  }

  void _onStartRegister(
    StartRegister event,
    Emitter<RegisterState> emit,
  ) async {
    await _databaseRepository.createUser(event.user);
    emit(RegisterLoaded(user: event.user));
  }

  void _onUpdateUser(
    UpdateUser event,
    Emitter<RegisterState> emit,
  ) {
    if (state is RegisterLoaded) {
      _databaseRepository.updateUser(event.user);
      emit(RegisterLoaded(user: event.user));
    }
  }
}

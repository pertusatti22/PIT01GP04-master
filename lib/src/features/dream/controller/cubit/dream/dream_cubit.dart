import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../model/failure.dart';
import '../../../model/dream_model.dart';
import '../../../repository/dream_repository.dart';

part 'dream_state.dart';

class DreamCubit extends Cubit<DreamState> {
  final DreamRepository dreamRepository;

  DreamCubit({required this.dreamRepository}) : super(DreamInitial());

  Future<void> fetchDreams() async {
    emit(DreamLoading());
    try {
      final List<Dream>? dreamList = await dreamRepository.getDreamList();
      emit(DreamLoaded(dreamList: dreamList ?? []));
    } on Failure catch (err) {
      emit(DreamError(failure: err));
    } catch (e) {
      log('$e');
    }
  }
}

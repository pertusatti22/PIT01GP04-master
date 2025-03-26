import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pit01gp04/src/features/home/model/bill_model.dart';
import 'package:pit01gp04/src/model/failure.dart';

import '../../../repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  Future<void> fetchBills() async {
    emit(HomeLoading());
    try {
      final List<Bill>? billList = await homeRepository.getBillsList();
      emit(HomeLoaded(billList: billList ?? []));
    } on Failure catch (err) {
      emit(HomeError(failure: err));
    } catch (e) {
      log('$e');
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../model/failure.dart';
import '../../../model/account_model.dart';
import '../../../repository/account_repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository accountRepository;

  AccountCubit({required this.accountRepository}) : super(AccountInitial());

  Future<void> fetchAccounts() async {
    emit(AccountLoading());
    try {
      final List<Account>? accountList =
          await accountRepository.getAccountList();
      emit(AccountLoaded(accountList: accountList ?? []));
    } on Failure catch (err) {
      emit(AccountError(failure: err));
    } catch (e) {
      log('$e');
    }
  }
}

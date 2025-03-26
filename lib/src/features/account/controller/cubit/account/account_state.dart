part of 'account_cubit.dart';

class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final List<Account> accountList;

  const AccountLoaded({
    required this.accountList,
  });

  @override
  List<Object> get props => [accountList];
}

class AccountError extends AccountState {
  final Failure failure;

  const AccountError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

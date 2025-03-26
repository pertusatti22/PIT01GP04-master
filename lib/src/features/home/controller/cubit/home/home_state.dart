part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Bill> billList;

  const HomeLoaded({
    required this.billList,
  });

  @override
  List<Object> get props => [billList];
}

class HomeError extends HomeState {
  final Failure failure;

  const HomeError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

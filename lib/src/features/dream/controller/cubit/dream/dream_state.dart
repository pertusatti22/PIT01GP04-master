part of 'dream_cubit.dart';

abstract class DreamState extends Equatable {
  const DreamState();

  @override
  List<Object> get props => [];
}

class DreamInitial extends DreamState {}

class DreamLoading extends DreamState {}

class DreamLoaded extends DreamState {
  final List<Dream> dreamList;

  const DreamLoaded({
    required this.dreamList,
  });

  @override
  List<Object> get props => [dreamList];
}

class DreamError extends DreamState {
  final Failure failure;

  const DreamError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

part of 'home_bloc.dart';

class HomeState extends Equatable {
  final GetStatus getStatus;

  const HomeState({
    this.getStatus = GetStatus.loading,
  });

  HomeState copyWith({
    GetStatus? getStatus,
  }) =>
      HomeState(
        getStatus: getStatus ?? this.getStatus,
      );

  @override
  List<Object> get props => [getStatus];
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

enum GetStatus { initial, loading, success, error }

extension GetStatusX on GetStatus {
  bool get initial => this == GetStatus.initial;

  bool get loading => this == GetStatus.loading;

  bool get success => this == GetStatus.success;

  bool get error => this == GetStatus.error;
}

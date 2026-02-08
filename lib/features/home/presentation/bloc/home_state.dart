part of 'home_bloc.dart';

class HomeState extends Equatable {
  final GetStatus getStatus;
  // final HomeModel? homeData;

  const HomeState({
    this.getStatus = GetStatus.initial,
    // this.homeData,
  });

  HomeState copyWith({
    GetStatus? getStatus,
    HomeModel? homeData,
  }) =>
      HomeState(
        getStatus: getStatus ?? this.getStatus,
        // homeData: homeData ?? this.homeData,
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

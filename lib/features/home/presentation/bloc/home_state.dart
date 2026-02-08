part of 'home_bloc.dart';

class HomeState extends Equatable {
  final GetStatus getStatus;
  final ResumeModel resumeData;

  const HomeState({
    this.getStatus = GetStatus.initial,
    this.resumeData = const ResumeModel(),
  });

  HomeState copyWith({
    GetStatus? getStatus,
    ResumeModel? resumeData,
  }) =>
      HomeState(
        getStatus: getStatus ?? this.getStatus,
        resumeData: resumeData ?? this.resumeData,
      );

  @override
  List<Object> get props => [getStatus, resumeData];
}

enum GetStatus { initial, loading, success, error }

extension GetStatusX on GetStatus {
  bool get initial => this == GetStatus.initial;

  bool get loading => this == GetStatus.loading;

  bool get success => this == GetStatus.success;

  bool get error => this == GetStatus.error;
}

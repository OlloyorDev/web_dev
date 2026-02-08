part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetInitialData extends HomeEvent {
  final String languageCode;

  const GetInitialData({this.languageCode = 'en'});

  @override
  List<Object?> get props => [languageCode];
}

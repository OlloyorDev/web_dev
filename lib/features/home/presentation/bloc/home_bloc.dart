import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/features/home/data/model/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetInitialData>(_getInitialData);
  }

  Future<void> _getInitialData(
    GetInitialData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getStatus: GetStatus.loading));
    try {
      final snapshot =
          await FirebaseFirestore.instance.collectionGroup('home').get();

      AboutMe aboutMe;
      List<Experience> experience;
      List<Projects> projects;
      List<Contact> contacts;

      aboutMe = AboutMe.fromJson(snapshot.docs.first.data());

      print('homeData: $aboutMe');
    } catch (e, stackTrace) {
      debugPrint('Error fetching data: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }
}

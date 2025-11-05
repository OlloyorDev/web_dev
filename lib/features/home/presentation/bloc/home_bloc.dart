import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetInitialData>(_getInitialData);
  }

  Future<void> _getInitialData(
    GetInitialData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collectionGroup('uz').get();
      final data = snapshot.docs.map((e) => e.data()).toList();
      debugPrint('Firestore data: $data');
      if (data.isNotEmpty) {
        emit(state.copyWith(getStatus: GetStatus.success));
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }
}

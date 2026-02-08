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

      if (snapshot.docs.isEmpty) {
        emit(state.copyWith(getStatus: GetStatus.error));
        return;
      }

      AboutMe? aboutMe;
      List<Experience> experiences = [];
      List<Projects> projects = [];
      List<Contact> contacts = [];

      for (final doc in snapshot.docs) {
        final data = doc.data();
        final type = data['type'] as String?;

        switch (type) {
          case 'about_me':
            aboutMe = AboutMe.fromJson(data);
            break;
          case 'experience':
            experiences.add(Experience.fromJson(data));
            break;
          case 'project':
            projects.add(Projects.fromJson(data));
            break;
          case 'contact':
            contacts.add(Contact.fromJson(data));
            break;
          default:
            aboutMe ??= AboutMe.fromJson(data);
        }
      }

      emit(state.copyWith(
        getStatus: GetStatus.success,
        homeData: HomeModel(
          aboutMe: aboutMe,
          experiences: experiences,
          projects: projects,
          contacts: contacts,
        ),
      ));
    } catch (e, stackTrace) {
      debugPrint('Error fetching data: $e');
      debugPrint('Stack trace: $stackTrace');
      emit(state.copyWith(getStatus: GetStatus.error));
    }
  }
}

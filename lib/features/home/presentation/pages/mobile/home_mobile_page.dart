import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Text(
              'Mobile Home Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/src/home/bloc/home_bloc.dart';
import 'package:web_devop/src/home/presentation/screen/home_screen.dart';

mixin HomeMixin on State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<HomeBloc>().add(GetEmployeesEvent(token: widget.token));
    super.initState();
  }
  @override
  void dispose() {
    scaffoldKey.currentState?.dispose();
    super.dispose();
  }
}

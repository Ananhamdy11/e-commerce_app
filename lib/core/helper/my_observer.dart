import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver {
  @override
  @override
  void onClose(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}

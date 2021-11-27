import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_bloc_event.dart';
part 'registration_bloc_state.dart';

class RegistrationBlocBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  RegistrationBlocBloc()
      : super(
            RegistrationBlocState(savingOption: AutomaticSavingOption.never)) {
    on<ChangeName>((event, emit) {
      _changeName(event, emit);
    });
    on<ChangeInitialSaving>((event, emit) {
      _changeInitialSaving(event, emit);
    });
    // on<ChangeName>((event, emit) {
    //   _changeName(event, emit);
    // });
    // on<ChangeName>((event, emit) {
    //   _changeName(event, emit);
    // });
    // on<ChangeName>((event, emit) {
    //   _changeName(event, emit);
    // });
    // on<ChangeName>((event, emit) {
    //   _changeName(event, emit);
    // });
  }

  @override
  void onChange(Change<RegistrationBlocState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(
      Transition<RegistrationBlocEvent, RegistrationBlocState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void _changeName(ChangeName event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _changeInitialSaving(
      ChangeInitialSaving event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(initialSaving: event.initialSaving));
  }
  // void _changeAutomaticSaving(ChangeName event, Emitter<RegistrationBlocState> emit) {
  //   emit(state.copyWith(name: event.name));
  // }
  // void _changePayDay(ChangeName event, Emitter<RegistrationBlocState> emit) {
  //   emit(state.copyWith(name: event.name));
  // }
  // void _changeMonthlyIncome(ChangeName event, Emitter<RegistrationBlocState> emit) {
  //   emit(state.copyWith(name: event.name));
  // }

}

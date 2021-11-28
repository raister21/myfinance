import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_bloc_event.dart';
part 'registration_bloc_state.dart';

class RegistrationBlocBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  RegistrationBlocBloc()
      : super(RegistrationBlocState(
            initialSaving: 0, savingOption: AutomaticSavingOption.never)) {
    on<ChangeName>((event, emit) {
      _changeName(event, emit);
    });
    on<ChangeInitialSaving>((event, emit) {
      _changeInitialSaving(event, emit);
    });
    on<ChangeAutomaticSaving>((event, emit) {
      _changeAutomaticSaving(event, emit);
    });
    on<ChangePayDay>((event, emit) {
      _changePayDay(event, emit);
    });
    on<ChangeMonthlyIncome>((event, emit) {
      _changeMonthlyIncome(event, emit);
    });
  }

  @override
  void onChange(Change<RegistrationBlocState> change) {
    super.onChange(change);
    print(" \x1B[32mCurrent State:\x1B[0m");
    change.currentState.getStateDisplay();
    print("\n \x1B[32mCurrent State:\x1B[0m");
    change.nextState.getStateDisplay();
  }

  @override
  void onTransition(
      Transition<RegistrationBlocEvent, RegistrationBlocState> transition) {
    super.onTransition(transition);
    print("\x1B[35mEvent: ${transition.event.runtimeType}\x1B[0m");
  }

  void _changeName(ChangeName event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _changeInitialSaving(
      ChangeInitialSaving event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(initialSaving: event.initialSaving));
  }

  void _changeAutomaticSaving(
      ChangeAutomaticSaving event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(savingOption: event.savingOption));
  }

  void _changePayDay(ChangePayDay event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(salaryDate: event.salaryDate));
  }

  void _changeMonthlyIncome(
      ChangeMonthlyIncome event, Emitter<RegistrationBlocState> emit) {
    emit(state.copyWith(monthlyIncome: event.monthlyIncome));
  }
}

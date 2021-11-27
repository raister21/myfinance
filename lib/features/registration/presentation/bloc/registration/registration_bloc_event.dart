part of 'registration_bloc_bloc.dart';

@immutable
abstract class RegistrationBlocEvent {}

class ChangeName extends RegistrationBlocEvent {
  final String name;

  ChangeName({required this.name});
}

class ChangeInitialSaving extends RegistrationBlocEvent {
  final double initialSaving;
  ChangeInitialSaving({required this.initialSaving});
}



// void _changeInitialSaving(ChangeName event, Emitter<RegistrationBlocState> emit) {
//     emit(state.copyWith(name: event.name));
//   }
//   void _changeAutomaticSaving(ChangeName event, Emitter<RegistrationBlocState> emit) {
//     emit(state.copyWith(name: event.name));
//   }
//   void _changePayDay(ChangeName event, Emitter<RegistrationBlocState> emit) {
//     emit(state.copyWith(name: event.name));
//   }
//   void _changeMonthlyIncome(ChangeName event, Emitter<RegistrationBlocState> emit) {
//     emit(state.copyWith(name: event.name));
//   }
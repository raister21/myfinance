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

class ChangeAutomaticSaving extends RegistrationBlocEvent {
  final AutomaticSavingOption savingOption;

  ChangeAutomaticSaving({required this.savingOption});
}

class ChangePayDay extends RegistrationBlocEvent {
  final DateTime salaryDate;

  ChangePayDay({required this.salaryDate});
}

class ChangeMonthlyIncome extends RegistrationBlocEvent {
  final double monthlyIncome;

  ChangeMonthlyIncome({required this.monthlyIncome});
}

class SaveRegistration extends RegistrationBlocEvent {
  final RegistrationBlocState state;
  final SetProfileInformation setProfileInformation;

  SaveRegistration({required this.state, required this.setProfileInformation});
}

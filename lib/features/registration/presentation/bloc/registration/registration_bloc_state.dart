part of 'registration_bloc_bloc.dart';

enum AutomaticSavingOption {
  never,
  yes,
}

class RegistrationBlocState {
  final String? name;
  final double? initialSaving;
  final AutomaticSavingOption? savingOption;
  final DateTime? salaryDate;
  final double? monthlyIncome;

  RegistrationBlocState(
      {this.name,
      this.initialSaving,
      this.savingOption,
      this.salaryDate,
      this.monthlyIncome});

  RegistrationBlocState copyWith(
      {String? name,
      double? initialSaving,
      AutomaticSavingOption? savingOption,
      DateTime? salaryDate,
      double? monthlyIncome}) {
    return RegistrationBlocState(
      name: name ?? this.name,
      initialSaving: initialSaving ?? this.initialSaving,
      savingOption: savingOption ?? this.savingOption,
      salaryDate: salaryDate ?? this.salaryDate,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
    );
  }
}

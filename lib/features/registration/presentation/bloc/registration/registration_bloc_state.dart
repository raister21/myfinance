part of 'registration_bloc_bloc.dart';

enum AutomaticSavingOption {
  never,
  yes,
}

extension AutomaticSavingOptionExtension on AutomaticSavingOption {
  String get name {
    switch (this) {
      case AutomaticSavingOption.never:
        return 'Never';
      case AutomaticSavingOption.yes:
        return 'Yes';
      default:
        return "Never";
    }
  }
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

  void getStateDisplay() {
    print("Name: ${this.name}");
    print("InitialSaving: ${this.initialSaving}");
    print("SavingOption: ${this.savingOption}");
    print("SalaryDate: ${this.salaryDate}");
    print("MonthlyIncome: ${this.monthlyIncome}");
  }
}

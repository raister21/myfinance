part of 'profile_bloc.dart';

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

@immutable
abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileInitialized extends ProfileState {
  final Profile profile;

  ProfileInitialized({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ApplicationInitialized extends ProfileState {
  @override
  List<Object?> get props => [];
}

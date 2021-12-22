part of 'profile_bloc.dart';

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

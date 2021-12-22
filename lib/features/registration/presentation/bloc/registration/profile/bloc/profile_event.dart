part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

class GetProfileInformationEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class SetProfileInformationEvent extends ProfileEvent {
  final Profile profile;

  SetProfileInformationEvent({required this.profile});
  @override
  List<Object?> get props => [profile];
}

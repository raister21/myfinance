import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/usecases/get_profile_information.dart';
import 'package:myfinance/features/registration/domain/usecases/set_profile_information.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileInformation getProfileInformation;
  final SetProfileInformation setProfileInformation;

  ProfileBloc(
      {required this.getProfileInformation,
      required this.setProfileInformation})
      : super(ProfileInitial()) {
    on<GetProfileInformationEvent>((event, emit) => _getProfile(event, emit));
    on<SetProfileInformationEvent>((event, emit) => _setProfile(event, emit));
  }

  void _getProfile(
      GetProfileInformationEvent event, Emitter<ProfileState> emit) async {
    final profile = await getProfileInformation.execute();
    emit(ProfileInitialized(profile: profile));
  }

  void _setProfile(
      SetProfileInformationEvent event, Emitter<ProfileState> emit) async {
    final bool didProfileSet =
        await setProfileInformation.execute(event.profile);
    if (didProfileSet) {
      emit(ProfileInitialized(profile: event.profile));
    } else {
      emit(ProfileInitial());
    }
  }
}

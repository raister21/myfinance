import 'package:myfinance/features/registration/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({required String name}) : super(name: name);

  factory ProfileModel.fromJson(Map<String, dynamic> data) {
    return ProfileModel(name: data['name']);
  }
}

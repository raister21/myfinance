import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;

  const Profile({required this.name});

  @override
  List<Object?> get props => [name];
}

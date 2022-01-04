import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 1)
class Profile extends Equatable {
  @HiveField(0)
  final String name;

  const Profile({required this.name});

  @override
  List<Object?> get props => [name];
}

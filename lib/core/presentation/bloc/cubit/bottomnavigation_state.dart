part of 'bottomnavigation_cubit.dart';

// @immutable
// abstract class BottomnavigationState {
//   final int index;

//   const BottomnavigationState({required this.index});
// }

// class BottomnavigationInitial extends BottomnavigationState {
//   const BottomnavigationInitial() : super();
// }

class BottomnavigationState {
  final int index;
  final int? subIndex;

  const BottomnavigationState({required this.index, this.subIndex = 0});
}

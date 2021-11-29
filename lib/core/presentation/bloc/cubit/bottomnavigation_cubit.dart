import 'package:bloc/bloc.dart';

part 'bottomnavigation_state.dart';

class BottomnavigationCubit extends Cubit<BottomnavigationState> {
  BottomnavigationCubit() : super(const BottomnavigationState(index: 0));

  void changeNavIndex({required int newIndex, int? newSubIndex}) => emit(
        BottomnavigationState(index: newIndex, subIndex: newSubIndex),
      );

  @override
  void onChange(Change<BottomnavigationState> change) {
    super.onChange(change);
    print(
        " \x1B[32mCurrent Navigation State:\x1B[0m ${change.currentState.index}");

    print("\n \x1B[33mNext Navigation State:\x1B[0m ${change.nextState.index}");
  }
}

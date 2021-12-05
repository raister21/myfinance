import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'inputoverlay_state.dart';

class InputoverlayCubit extends Cubit<InputoverlayState> {
  InputoverlayCubit() : super(InputoverlayInitial());

  void infalteOverlay({required OverlayEntry overlay}) =>
      emit(IntputOverlayInflated(overlayEntry: overlay));

  void defalteOverlay({required OverlayEntry overlay}) =>
      emit(InputOverlayClose(overlayEntry: overlay));

  void deflateAllOverlay(IntputOverlayInflated state) {
    state.overlayEntry.remove();
    emit(InputoverlayInitial());
  }

  void cleanOverlay() => emit(InputoverlayInitial());

  @override
  void onChange(Change<InputoverlayState> change) {
    super.onChange(change);
    print(
        " \x1B[32mCurrent Input overlay State:\x1B[0m ${change.currentState}");

    print("\n \x1B[33mNext Input overlay State:\x1B[0m ${change.nextState}");
  }
}

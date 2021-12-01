part of 'inputoverlay_cubit.dart';

@immutable
abstract class InputoverlayState {}

class InputoverlayInitial extends InputoverlayState {}

class IntputOverlayInflated extends InputoverlayState {
  final OverlayEntry overlayEntry;

  IntputOverlayInflated({required this.overlayEntry});
}

class InputOverlayClose extends InputoverlayState {
  final OverlayEntry overlayEntry;

  InputOverlayClose({required this.overlayEntry});
}

import 'package:flutter/material.dart';

OverlayEntry inputOverlay({
  required double overlayWidth,
  required double overlayHeight,
}) {
  return OverlayEntry(builder: (context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: overlayHeight,
          width: overlayWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Text("gg"),
        ),
      ),
    );
  });
}

import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/presentation/widgets/button.dart';
import 'package:myfinance/core/presentation/widgets/input_field.dart';
import 'package:myfinance/core/presentation/widgets/needs_wants_button_bar.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';

OverlayEntry editOverlay({
  required double widgetHeight,
  required double widgetWidth,
  required InputoverlayCubit cubit,
}) {
  return OverlayEntry(
    builder: (context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widgetWidth / 20,
            vertical: widgetHeight / 40,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: widgetHeight * 0.7,
              width: widgetWidth,
              padding: EdgeInsets.symmetric(
                vertical: widgetHeight / 60,
                horizontal: widgetWidth / 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Edit",
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: widgetHeight / 60),
                          ),
                          InputField(
                            widgetWidth: widgetWidth,
                            header: "Item",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: widgetHeight / 60),
                          ),
                          InputField(
                            widgetWidth: widgetWidth,
                            header: "From",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: widgetHeight / 60),
                          ),
                          InputField(
                            widgetWidth: widgetWidth,
                            header: "Amount",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: widgetHeight / 60),
                          ),
                          NeedsWantsButtonBar(
                            widgetHeight: widgetHeight,
                            widgetWidth: widgetWidth,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: widgetHeight / 60),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    onClickEvent: () {
                      final disposeOverlay =
                          (cubit.state as IntputOverlayInflated).overlayEntry;

                      cubit.defalteOverlay(overlay: disposeOverlay);
                      cubit.cleanOverlay();
                    },
                    widgetWidth: widgetWidth,
                    widgetHeight: widgetHeight,
                    buttonName: "Done",
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

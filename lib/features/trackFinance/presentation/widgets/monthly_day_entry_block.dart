import 'package:flutter/widgets.dart';

import 'package:myfinance/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:myfinance/core/presentation/widgets/core_overlay.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/monthly_single_entry.dart';

class MonthlyDayEntryBloc extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  final InputoverlayCubit cubit;
  const MonthlyDayEntryBloc(
      {Key? key,
      required this.widgetHeight,
      required this.widgetWidth,
      required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetHeight,
      width: widgetWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: widgetHeight / 30,
              horizontal: widgetWidth / 20,
            ),
            decoration: const BoxDecoration(
              color: transWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  flex: 1,
                  child: Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Item",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Purpose",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: transBlack,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    MonthlySingleEntry(
                      widgetHeight: widgetHeight,
                      widgetWidth: widgetWidth,
                      onTapCallBack: () {
                        cubit.infalteOverlay(
                          overlay: editOverlay(
                            widgetHeight: MediaQuery.of(context).size.height,
                            widgetWidth: MediaQuery.of(context).size.width,
                            cubit: cubit,
                          ),
                        );
                      },
                    ),
                    MonthlySingleEntry(
                      widgetHeight: widgetHeight,
                      widgetWidth: widgetWidth,
                      onTapCallBack: () {
                        cubit.infalteOverlay(
                          overlay: editOverlay(
                            widgetHeight: MediaQuery.of(context).size.height,
                            widgetWidth: MediaQuery.of(context).size.width,
                            cubit: cubit,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/monthly_day_entry_block.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/monthly_single_date.dart';

class MonthlyInfoBlock extends StatefulWidget {
  final InputoverlayCubit cubit;
  const MonthlyInfoBlock({Key? key, required this.cubit}) : super(key: key);

  @override
  State<MonthlyInfoBlock> createState() => _MonthlyInfoBlockState();
}

class _MonthlyInfoBlockState extends State<MonthlyInfoBlock> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MonthlySingleDate(
                widgetWidth: MediaQuery.of(context).size.width,
                widgetHeight: MediaQuery.of(context).size.height,
              ),
              MonthlySingleDate(
                widgetWidth: MediaQuery.of(context).size.width,
                widgetHeight: MediaQuery.of(context).size.height,
              ),
              MonthlySingleDate(
                widgetWidth: MediaQuery.of(context).size.width,
                widgetHeight: MediaQuery.of(context).size.height,
                isSelected: true,
              ),
              MonthlySingleDate(
                widgetWidth: MediaQuery.of(context).size.width,
                widgetHeight: MediaQuery.of(context).size.height,
              ),
              MonthlySingleDate(
                  widgetWidth: MediaQuery.of(context).size.width,
                  widgetHeight: MediaQuery.of(context).size.height),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30,
            ),
          ),
          Expanded(
            child: MonthlyDayEntryBloc(
              widgetHeight: MediaQuery.of(context).size.height,
              widgetWidth: MediaQuery.of(context).size.width,
              cubit: widget.cubit,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30,
            ),
          ),
        ],
      ),
    );
  }
}

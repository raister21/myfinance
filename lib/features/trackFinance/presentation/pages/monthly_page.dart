import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/monthly_header_block.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/monthly_info_block.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  _MonthlyPageState createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  late final InputoverlayCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<InputoverlayCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _monthlyPageStructure();
  }

  Widget _monthlyPageStructure() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20,
        MediaQuery.of(context).size.height / 40,
        MediaQuery.of(context).size.width / 20,
        0,
      ),
      child: Column(
        children: [
          const MonthlyHeaderBlock(),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30,
            ),
          ),
          MonthlyInfoBlock(
            cubit: _cubit,
          ),
        ],
      ),
    );
  }
}

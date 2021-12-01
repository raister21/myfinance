import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/input_action_block.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/input_body_block.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/input_input_overlay.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late final InputoverlayCubit _cubit;

  @override
  void initState() {
    // TODO: implement initState
    _cubit = BlocProvider.of<InputoverlayCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InputoverlayCubit, InputoverlayState>(
      listener: (context, state) {
        if (state is IntputOverlayInflated) {
          Overlay.of(context)!.insert(state.overlayEntry);
        } else if (state is InputOverlayClose) {
          state.overlayEntry.remove();
          _cubit.cleanOverlay();
        }
      },
      child: _inputPageStructure(),
    );
  }

  Widget _inputPageStructure() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 20,
        MediaQuery.of(context).size.height / 40,
        MediaQuery.of(context).size.width / 20,
        0,
      ),
      child: Column(
        children: [
          const Text(
            "Daily Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Tap to change item",
              style: TextStyle(
                color: grey,
                fontSize: 12,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2,
            ),
          ),
          const Expanded(child: InputBodyBlock()),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Tap to change item",
              style: TextStyle(
                color: grey,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
            ),
          ),
          BlocBuilder<InputoverlayCubit, InputoverlayState>(
            builder: (context, state) {
              return InputActionBlock(
                inputCallBack: () {
                  _cubit.infalteOverlay(
                    overlay: inputOverlay(
                      overlayWidth: MediaQuery.of(context).size.width * 0.8,
                      overlayHeight: MediaQuery.of(context).size.height / 2,
                    ),
                  );
                },
                outputCallBack: () {
                  if (state is IntputOverlayInflated) {
                    _cubit.defalteOverlay(overlay: state.overlayEntry);
                  }
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
            ),
          ),
        ],
      ),
    );
  }
}

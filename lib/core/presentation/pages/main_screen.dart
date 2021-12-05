import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/presentation/bloc/cubit/bottomnavigation_cubit.dart';
import 'package:myfinance/core/presentation/widgets/bottom_navigation.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';
import 'package:myfinance/features/trackFinance/presentation/pages/input_page.dart';
import 'package:myfinance/features/viewFinance/presentation/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final BottomnavigationCubit _bloc;
  late final InputoverlayCubit _inputCubit;
  late final Widget _inputPage;

  late List<Widget> pages = [];

  @override
  void initState() {
    _bloc = BlocProvider.of<BottomnavigationCubit>(context);
    _inputCubit = BlocProvider.of<InputoverlayCubit>(context);

    _inputPage = BlocProvider.value(
      value: _inputCubit,
      child: const InputPage(),
    );
    pages = [
      const HomePage(),
      _inputPage,
      const Text("moda"),
      const Text("fada")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: BlocListener<InputoverlayCubit, InputoverlayState>(
        listener: (context, state) {
          if (state is IntputOverlayInflated) {
            Overlay.of(context)!.insert(state.overlayEntry);
          } else if (state is InputOverlayClose) {
            state.overlayEntry.remove();
            _inputCubit.cleanOverlay();
          }
        },
        child: BlocBuilder<InputoverlayCubit, InputoverlayState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async {
                if (state is IntputOverlayInflated) {
                  state.overlayEntry.remove();
                  _inputCubit.cleanOverlay();
                  return false;
                } else {
                  return true;
                }
              },
              child: Stack(
                children: [
                  _mainScreenStructre(),
                  IgnorePointer(
                    ignoring: state is! IntputOverlayInflated,
                    child: GestureDetector(
                      onTap: () {
                        if (state is IntputOverlayInflated) {
                          state.overlayEntry.remove();
                          _inputCubit.cleanOverlay();
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(14, 14, 14,
                            state is IntputOverlayInflated ? 0.7 : 0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _mainScreenStructre() {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fill),
        ),
      ),
      BlocBuilder<BottomnavigationCubit, BottomnavigationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SafeArea(child: pages[state.index]),
              ),
              BottomNavigation(
                changeNavIndex: (navigationIndex) {
                  _bloc.changeNavIndex(newIndex: navigationIndex);
                },
                selectedIndex: state.index,
              ),
            ],
          );
        },
      ),
    ]);
  }
}

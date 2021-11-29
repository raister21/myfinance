import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/presentation/bloc/cubit/bottomnavigation_cubit.dart';
import 'package:myfinance/core/presentation/widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final BottomnavigationCubit _bloc;

  List<Widget> pages = const [
    Text("hey"),
    Text("you"),
    Text("moda"),
    Text("fada")
  ];

  @override
  void initState() {
    _bloc = BlocProvider.of<BottomnavigationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: _mainScreenStructre(),
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

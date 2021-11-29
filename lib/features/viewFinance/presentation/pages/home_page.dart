import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/core/presentation/widgets/goal_indicator_bar.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_goal_block.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_header_block.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _homeScreenStructre();
  }

  Widget _homeScreenStructre() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 20,
          MediaQuery.of(context).size.height / 40,
          MediaQuery.of(context).size.width / 20,
          0),
      child: Column(
        children: [
          const HomeHeaderBlock(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
            ),
          ),
          const HomeGoalBlock(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Monthly Overview",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

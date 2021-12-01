import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/presentation/widgets/goal_indicator_bar.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_goal_block.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_header_block.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_individual_circular_indicator.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_monthy_overview_block.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_progress_block.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 20,
          MediaQuery.of(context).size.height / 40,
          MediaQuery.of(context).size.width / 20,
          0,
        ),
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
            const HomeMonthlyOverviewBlock(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 80,
              ),
            ),
            HomeProgressBlock(
              features: [
                Feature(
                  title: "Saving",
                  color: green,
                  data: [1, 0.8, 0.1, 0.1],
                ),
              ],
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

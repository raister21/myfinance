import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/features/viewFinance/presentation/widgets/home_individual_circular_indicator.dart';

class HomeMonthlyOverviewBlock extends StatelessWidget {
  const HomeMonthlyOverviewBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Monthly Overview",
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
        Row(
          children: [
            const Expanded(
              child: HomeIndividualCircularIndicator(
                  label: "Need", color: red, percent: 0.5, amount: 20000),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 40,
              ),
            ),
            const Expanded(
              child: HomeIndividualCircularIndicator(
                  label: "Want", color: blue, percent: 0.25, amount: 20000),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 90,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Expanded(
              child: HomeIndividualCircularIndicator(
                isLarger: true,
                label: "Saving",
                color: green,
                percent: 0.25,
                amount: 20000,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

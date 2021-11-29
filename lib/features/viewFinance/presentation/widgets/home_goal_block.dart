import 'package:flutter/material.dart';
import 'package:myfinance/core/presentation/widgets/goal_indicator_bar.dart';

class HomeGoalBlock extends StatelessWidget {
  const HomeGoalBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Goal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 40,
          ),
          child:
              GoalIndicatorBar(widgetWidth: MediaQuery.of(context).size.width),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Saving",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "10,000 Rps",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Wants",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "10,000 Rps",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Needs",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "10,000 Rps",
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

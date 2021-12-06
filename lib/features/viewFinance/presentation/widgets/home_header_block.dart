import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/core/config/app_config.dart';

class HomeHeaderBlock extends StatelessWidget {
  const HomeHeaderBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const Text(
                  "2 Potatoes",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Income",
                          style: TextStyle(
                            fontSize: 14,
                            color: green,
                          ),
                        ),
                        Text(
                          "25 km/h",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    Column(
                      children: const [
                        Text(
                          "Expenditure",
                          style: TextStyle(
                            fontSize: 14,
                            color: red,
                          ),
                        ),
                        Text(
                          "y r u ronin5",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // TODO : USE DATE UTIL CLASs

                const Text(
                  "17 August 2021",
                  style: TextStyle(
                    height: 3,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/demoPic.png"),
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: "Days left ",
                  style: TextStyle(
                    height: 3,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  children: [
                    TextSpan(
                      text: "17",
                      style: TextStyle(
                        height: 3,
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

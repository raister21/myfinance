import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:myfinance/features/registration/presentation/widgets/infographic_button.dart';

class InfoGraphicScreen extends StatefulWidget {
  static const String routeName = "/infographicScreen";
  const InfoGraphicScreen({Key? key}) : super(key: key);

  @override
  State<InfoGraphicScreen> createState() => _InfoGraphicScreenState();
}

class _InfoGraphicScreenState extends State<InfoGraphicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: SafeArea(
        child: _infoGraphicStructre(),
      ),
    );
  }

  Widget _infoGraphicStructre() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 20,
                    top: MediaQuery.of(context).size.height / 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Simple way to",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: 'manage your ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                  text: 'Personal ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Finanace',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 16),
                child: SvgPicture.asset("assets/images/infographicImage.svg"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 12,
                      right: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: "Track every ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            children: [
                              TextSpan(
                                text: "Income",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: "and ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            children: [
                              TextSpan(
                                text: "Purchases",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 36,
                      left: MediaQuery.of(context).size.width / 20),
                  child: const Text(
                    "Get started now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 16),
                child: InfographicButton(
                    buttonWidth: MediaQuery.of(context).size.width,
                    buttonHeight: MediaQuery.of(context).size.height / 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}

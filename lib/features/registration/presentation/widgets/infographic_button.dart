import 'package:flutter/material.dart';
import 'package:myfinance/config/app_config.dart';
import 'package:myfinance/features/registration/presentation/pages/registration_page.dart';

class InfographicButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  const InfographicButton(
      {Key? key, required this.buttonWidth, required this.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RegistrationScreen.routeName);
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryLight,
          ),
          child: const Center(
              child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
        ),
      ),
    );
  }
}

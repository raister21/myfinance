import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonthlyHeaderBlock extends StatelessWidget {
  const MonthlyHeaderBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/navigationArrowLeft.svg",
              color: Colors.white,
            ),
            const Text(
              "Nov",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const Text(
          "December",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.normal,
          ),
        ),
        Row(
          children: [
            const Text(
              "Jan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/navigationArrowRight.svg",
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

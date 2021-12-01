import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeIndividualCircularIndicator extends StatefulWidget {
  final String label;
  final Color color;
  final double percent;
  final double amount;
  final bool? isLarger;
  const HomeIndividualCircularIndicator({
    Key? key,
    required this.label,
    required this.color,
    required this.percent,
    required this.amount,
    this.isLarger = false,
  }) : super(key: key);

  @override
  _HomeIndividualCircularIndicatorState createState() =>
      _HomeIndividualCircularIndicatorState();
}

class _HomeIndividualCircularIndicatorState
    extends State<HomeIndividualCircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: transBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 40,
        vertical: MediaQuery.of(context).size.height / 60,
      ),
      child: Column(
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 60,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: CircularPercentIndicator(
              radius: widget.isLarger!
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width / 4,
              lineWidth: widget.isLarger! ? 20 : 15,
              percent: widget.percent,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${(widget.percent * 100).toInt().toString()} %",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.isLarger! ? 24 : 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              progressColor: widget.color,
              backgroundColor: grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 40,
            ),
          ),
          Text(
            '${widget.amount.toInt().toString()} Rps',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

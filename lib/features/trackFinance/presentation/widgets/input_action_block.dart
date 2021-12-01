import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/core/config/app_config.dart';

class InputActionBlock extends StatefulWidget {
  final Function() inputCallBack;
  final Function() outputCallBack;
  const InputActionBlock(
      {Key? key, required this.inputCallBack, required this.outputCallBack})
      : super(key: key);

  @override
  _InputActionBlockState createState() => _InputActionBlockState();
}

class _InputActionBlockState extends State<InputActionBlock> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              print("tapped in");
              widget.inputCallBack();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 60,
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment(0, -1.8),
                  end: Alignment(0, 2.0),
                  colors: [
                    Color(0xFFBDFBFF),
                    Color(0xFF00D415),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                "In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              widget.outputCallBack();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 60,
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0, -1.8),
                  end: Alignment(0, 2.0),
                  colors: [
                    Color(0xFFFFC6C6),
                    Color(0xFFF10A0A),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                color: red,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                "Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

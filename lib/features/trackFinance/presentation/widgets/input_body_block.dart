import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/features/trackFinance/presentation/widgets/input_item.dart';

class InputBodyBlock extends StatefulWidget {
  const InputBodyBlock({Key? key}) : super(key: key);

  @override
  State<InputBodyBlock> createState() => _InputBodyBlockState();
}

class _InputBodyBlockState extends State<InputBodyBlock> {
  List<Map<String, dynamic>> dummyList = [
    {
      "itemName": "Momo",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 100.0,
      // TODO: CHANGE TO TYPE OF TRANCATION
      "transactionType": true,
    },
    {
      "itemName": "Salary",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 20000.0,
      "transactionType": false,
    },
    {
      "itemName": "Salary",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 20000.0,
      "transactionType": false,
    },
    {
      "itemName": "Salary",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 20000.0,
      "transactionType": false,
    },
    {
      "itemName": "Salary",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 20000.0,
      "transactionType": false,
    },
    {
      "itemName": "Salary",
      "timeOfTransaction": DateTime.now(),
      "transactionAmount": 20000.0,
      "transactionType": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: transBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (BuildContext context, int index) {
            return InputItem(
              heightPadding: MediaQuery.of(context).size.height / 40,
              widthPadding: MediaQuery.of(context).size.width / 20,
              itemName: dummyList[index]['itemName'],
              timeOfTranscation: dummyList[index]['timeOfTransaction'],
              transactionAmount: dummyList[index]['transactionAmount'],
              transactionType: dummyList[index]['transactionType'],
            );
          }),
    );
  }
}

import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class HomeProgressBlock extends StatelessWidget {
  final List<Feature> features;
  final Size size;
  const HomeProgressBlock({
    Key? key,
    required this.features,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Progress",
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
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: LineGraph(
            features: features,
            size: size,
            graphOpacity: 0.1,
            labelX: const ['Nov 1', 'Nov 14', 'Nov 21', 'Nov 29'],
            labelY: const ['10 k', '20 k'],
          ),
        )
      ],
    );
  }
}

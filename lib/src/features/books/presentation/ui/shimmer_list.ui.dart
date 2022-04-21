import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Shimmer.fromColors(
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: SizedBox(
                  width: MediaQuery.of(_).size.width,
                  height: 100,
                ),
              ),
            ),
            itemCount: 6,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100),
    );
  }
}

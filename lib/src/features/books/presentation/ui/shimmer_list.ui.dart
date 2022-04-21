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
            itemBuilder: (_, __) => Container(
              padding: const EdgeInsets.all(5.0),
              height: 180,
              width: 300,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, right: 10),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Container()],
                        ),
                      ],
                    )),
              ),
            ),
            itemCount: 6,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100),
    );
  }
}

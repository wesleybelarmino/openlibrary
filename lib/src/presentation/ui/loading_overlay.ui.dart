import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Opacity(
          opacity: .6,
          child: Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}

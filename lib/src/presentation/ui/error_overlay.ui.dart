import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openlibrary/src/core/failure/failure.dart';

class ErrorOverlay extends StatefulWidget {
  final Failure? failure;
  final Function clearErroState;

  const ErrorOverlay(
      {Key? key, required this.failure, required this.clearErroState})
      : super(key: key);

  @override
  _ErrorOverlayState createState() => _ErrorOverlayState();
}

class _ErrorOverlayState extends State<ErrorOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
            child: Opacity(
              opacity: .6,
              child: Container(
                color: Colors.black,
                child: Container(),
              ),
            ),
            onWillPop: () async => false),
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          insetPadding: const EdgeInsets.all(15),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: AlertDialog(
              title: Text(widget.failure!.title),
              content: Text(widget.failure!.message),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    widget.clearErroState();
                  },
                ),
              ]),
        ),
      ],
    );
  }
}

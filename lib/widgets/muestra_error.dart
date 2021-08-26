import 'package:flutter/material.dart';

class MuestraError extends StatelessWidget {
  //final Error error;
  final String error;
  const MuestraError(this.error);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Center(
          child: Text(
            error,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

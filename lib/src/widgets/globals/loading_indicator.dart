import 'package:flutter/material.dart';

Widget loadingIndicator(bool isLoading) {
  if (!isLoading) return Container();

  return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.5),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    ],
  );
}

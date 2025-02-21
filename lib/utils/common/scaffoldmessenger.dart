import 'package:flutter/material.dart';

scaffoldmessenger(BuildContext context, String message, Color? bgcolor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
    ),
    content: Text(message),
    backgroundColor: bgcolor ?? const Color.fromARGB(255, 254, 78, 65),
  ));
}

import 'package:flutter/material.dart';

/// This file contains functions used for navigation.

void nextPage({required context, required page}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => page));
}

void replacePage({required context, required page}) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => page));
}

import 'package:flutter/material.dart';

Widget title({text, styles, limit = 25}) {
  return Text(
    text.length > limit ? text.substring(0, limit) + '...' : text,
    style: styles,
  );
}

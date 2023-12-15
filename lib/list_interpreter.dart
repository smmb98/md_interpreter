import 'package:flutter/material.dart';

Widget createBulletPointWidget(String line) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 16.0),
    // leading: const Icon(Icons.fiber_manual_record),
    title: Text("\u25cf  " + line.substring(2)),
  );
}

import 'package:flutter/material.dart';

void navigatorTo(BuildContext context, Widget view) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
}

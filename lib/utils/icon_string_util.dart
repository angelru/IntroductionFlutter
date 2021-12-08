import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.tune
};

Icon getIcon(String icon) {
  return Icon(_icons[icon], color: Colors.blue);
}

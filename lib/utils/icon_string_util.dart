import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

Icon getIcon(String icon) {
  return Icon(_icons[icon], color: Colors.blue);
}

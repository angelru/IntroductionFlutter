import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    loadDataAsync();
  }

  Future<List<dynamic>> loadDataAsync() async {
    final menu = await rootBundle.loadString('data/menu_opts.json');
    var dataMap = json.decode(menu);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = _MenuProvider();

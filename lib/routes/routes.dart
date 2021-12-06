import 'package:flutter/material.dart';

import 'package:componentes_flutter/pages/alert_page.dart';
import 'package:componentes_flutter/pages/avatar_page.dart';
import 'package:componentes_flutter/pages/home_page.dart';
import 'package:componentes_flutter/pages/cards_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage()
  };
}

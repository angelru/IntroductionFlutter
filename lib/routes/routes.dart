import 'package:flutter/material.dart';

import 'package:componentes_flutter/pages/alert_page.dart';
import 'package:componentes_flutter/pages/avatar_page.dart';
import 'package:componentes_flutter/pages/home_page.dart';
import 'package:componentes_flutter/pages/cards_page.dart';
import 'package:componentes_flutter/pages/animated_container.dart';
import 'package:componentes_flutter/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'inputs': (BuildContext context) => const InputPage(),
  };
}

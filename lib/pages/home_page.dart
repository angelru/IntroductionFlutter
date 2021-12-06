import 'package:flutter/material.dart';

import 'package:componentes_flutter/utils/icon_string_util.dart';
import 'package:componentes_flutter/pages/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _menu(),
    );
  }

  Widget _menu() {
    return FutureBuilder(
      future: menuProvider.loadDataAsync(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItems(List<dynamic>? items, BuildContext context) {
    final List<Widget> options = [];

    items?.forEach((item) {
      final temp = ListTile(
        title: Text(item['texto']),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, item['ruta']);
        },
      );

      options
        ..add(temp)
        ..add(Divider());
    });

    return options;
  }
}

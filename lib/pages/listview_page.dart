import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _numbers = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numbers[index];
          return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?random=$image'));
        });
  }
}

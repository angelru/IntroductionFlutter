import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  final List<int> _numbers = [];
  int number = 0;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

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
        controller: _scrollController,
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numbers[index];
          return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/300?image=$image'),
              placeholder: AssetImage('assets/jar-loading.gif'));
        });
  }

  void _loadMoreItems() {
    for (var i = 1; i < 10; i++) {
      _numbers.add(number++);
    }
    setState(() {});
  }
}

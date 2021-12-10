import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  final List<int> _numbers = [];
  int _number = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numbers.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _numbers[index];
            return FadeInImage(
                height: 300.0,
                width: 500.0,
                fit: BoxFit.cover,
                image:
                    NetworkImage('https://picsum.photos/500/300?image=$image'),
                placeholder: AssetImage('assets/jar-loading.gif'));
          }),
    );
  }

  void _loadMoreItems() {
    for (var i = 1; i < 10; i++) {
      _numbers.add(_number++);
    }
    setState(() {});
  }

  Future<void> fetchData() async {
    _isLoading = true;

    setState(() {});
    Timer(const Duration(seconds: 2), responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    _loadMoreItems();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[CircularProgressIndicator()],
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      );
    }

    return Container();
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    _numbers.clear();
    _number++;
    _loadMoreItems();
  }
}

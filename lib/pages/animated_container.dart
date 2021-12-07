import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _widht = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _widht,
          height: _height,
          decoration:
              BoxDecoration(borderRadius: _borderRadiusGeometry, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _change(),
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _change() {
    final random = Random();

    setState(() {
      _widht = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadiusGeometry =
          BorderRadius.circular(random.nextInt(300).toDouble());
    });
  }
}

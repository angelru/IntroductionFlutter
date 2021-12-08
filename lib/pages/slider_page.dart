import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: <Widget>[_createSlider(), _createImage()],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        label: 'Tamaño de la imagen',
        divisions: 20,
        value: _valueSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (value) {
          setState(() {
            _valueSlider = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
        image: const NetworkImage(
            'https://www.bunko.pet/__export/1620600598520/sites/debate/img/2021/05/09/rottweiler-cachorro_x1x_crop1620600005944.jpg_1564579138.jpg'),
        width: _valueSlider,
        fit: BoxFit.contain);
  }
}

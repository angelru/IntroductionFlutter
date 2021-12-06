import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.biografiasyvidas.com/monografia/chaplin/fotos/chaplin340a.jpg'),
          ),
          Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const CircleAvatar(
                child: Text('Sl'),
                backgroundColor: Colors.brown,
              )),
        ],
      ),
    );
  }
}

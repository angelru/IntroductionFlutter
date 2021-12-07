import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? _nombre;
  String? _email;
  String? _date;

  final TextEditingController _inputFieldDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _createInput(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPerson(),
          const Divider(),
          _createDate(context)
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          counter: const Text('Letras 0'),
          hintText: 'Pon tu nombre',
          labelText: 'Nombre'),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('El nombre es  $_nombre'),
      subtitle: Text('El correo es  $_email'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          hintText: 'Fecha',
          labelText: 'Fecha',
          suffixIcon: const Icon(Icons.perm_contact_calendar),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date!;
      });
    }
  }
}

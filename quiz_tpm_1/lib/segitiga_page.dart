import 'package:flutter/material.dart';
import 'package:quiz_tpm_1/main.dart';
import 'dart:math';

void main() {
  runApp(MenuSegitiga());
}

class MenuSegitiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Segitiga Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Segitiga Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _sisiAController = TextEditingController();
  final _sisiBController = TextEditingController();
  final _sisiCController = TextEditingController();
  double _luas = 0.0;
  double _keliling = 0.0;

  void _hitung() {
    double sisiA = double.parse(_sisiAController.text);
    double sisiB = double.parse(_sisiBController.text);
    double sisiC = double.parse(_sisiCController.text);

    double s = (sisiA + sisiB + sisiC) / 2;
    _luas = sqrt(s * (s - sisiA) * (s - sisiB) * (s - sisiC));
    _keliling = sisiA + sisiB + sisiC;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _sisiAController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Sisi A'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nilai sisi A';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sisiBController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Sisi B'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nilai sisi B';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sisiCController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Sisi C'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nilai sisi C';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _hitung();
                        }
                      },
                      child: Text('Hitung'),
                    ),
                  ),
                ),
                Center(child: Text('Luas: $_luas')),
                Center(child: Text('Keliling: $_keliling')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_tpm_1/main.dart';

void main() => runApp(LayangLayang());

class LayangLayang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _diagonal1Controller = TextEditingController();
  final TextEditingController _diagonal2Controller = TextEditingController();
  final TextEditingController _sisi1Controller = TextEditingController();
  final TextEditingController _sisi2Controller = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  void _hitungLuas() {
    double diagonal1 = double.parse(_diagonal1Controller.text);
    double diagonal2 = double.parse(_diagonal2Controller.text);
    setState(() {
      _luas = (diagonal1 * diagonal2) / 2;
    });
  }

  void _hitungKeliling() {
    double sisi1 = double.parse(_sisi1Controller.text);
    double sisi2 = double.parse(_sisi2Controller.text);
    setState(() {
      _keliling = 2 * (sisi1 + sisi2);
    });
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _diagonal1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan diagonal 1',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _diagonal2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan diagonal 2',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _hitungLuas,
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 16.0),
            Text('Luas: $_luas'),
            SizedBox(height: 16.0),
            TextField(
              controller: _sisi1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang sisi 1',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _sisi2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang sisi 2',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _hitungKeliling,
              child: Text('Hitung Keliling'),
            ),
            SizedBox(height: 16.0),
            Text('Keliling: $_keliling'),
          ],
        ),
      ),
    );
  }
}

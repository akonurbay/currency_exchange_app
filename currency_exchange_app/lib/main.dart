import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key:key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 1.0;
  double result = 0.0;

  final List<String> currencies = ['USD', 'EUR','GBR', 'TRY'];

  final TextEditingController _controller = TextEditingController();

  void convert() {
    //примитивная тестовая конвертация
    setState(() {
      result = amount * 0.9;
    });
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Currency Exchange'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all( 16.0),
          child: Column(
            children: [
              DropdownButton<String>(
                value: fromCurrency,
                onChanged: (value){
                  setState(() {
                  toCurrency = value!;
                  });
                },
                items: currencies
                .map((currency) => DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                ))
                .toList()
              ),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                onChanged:(value){
                  amount = double.tryParse(value) ?? 0.0;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: convert, 
                child: const Text('convert'),
              ),
              const SizedBox(height: 16.0),
              Text('Result: $result')
            ]
          )
        ),
    );
  }
}
import 'package:flutter/material.dart';
import '../services/currency_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 0;
  double result = 0;
  final CurrencyService _currencyService = CurrencyService();

  final List<String> currencies = ['USD', 'EUR', 'GBP', 'TRY'];

  final TextEditingController _controller = TextEditingController();

  void convert() async{
    // Примитивная конвертация для примера
    
    final rate = await _currencyService.fetchExchangeRate(fromCurrency, toCurrency);
    print('API rate: $rate');
    setState(() {
      //result = amount * 0.9; // Просто пример, позже заменим на API
      result = rate != null ? amount * rate : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Exchange'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          
          children: [
   Row(
    children: [
      Expanded(
        child: DropdownButton<String>(
          value: fromCurrency,
          onChanged: (value) {
            setState(() {
              fromCurrency = value!;
            });
          },
          items: currencies
              .map((currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  ))
              .toList(),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: DropdownButton<String>(
          value: toCurrency,
          onChanged: (value) {
            setState(() {
              toCurrency = value!;
            });
          },
          items: currencies
              .map((currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  ))
              .toList(),
        ),
      ),
    ],
  ),

            const SizedBox(height: 50),
            
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              onChanged: (value) {
                amount = double.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}
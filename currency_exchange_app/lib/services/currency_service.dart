/*import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  Future<double?> fetchExchangeRate(String from, String to) async {
    final url = Uri.parse('https://api.exchangerate.host/convert?from=$from&to=$to');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      print('API response: $data');
      print('Запрос к API: $url');
      return (data['result'] as num?)?.toDouble();
    } else {
      return null;
    }
  }
}*/

import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  Future<double?> fetchExchangeRate(String from, String to) async {
    final url = Uri.parse('https://open.er-api.com/v6/latest/$from');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('API response: $data');
      final rates = data['rates'];
      if (rates != null && rates[to] != null) {
        return (rates[to] as num).toDouble();
      }
    }
    return null;
  }
}
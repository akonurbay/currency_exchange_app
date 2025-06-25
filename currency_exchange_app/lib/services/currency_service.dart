
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
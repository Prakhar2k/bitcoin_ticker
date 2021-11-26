import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0DDC5DDA-31E6-48ED-A018-D0697AD02793';
const coinUrl = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get('$coinUrl/$crypto/$selectedCurrency?apikey=$apiKey');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price = data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}

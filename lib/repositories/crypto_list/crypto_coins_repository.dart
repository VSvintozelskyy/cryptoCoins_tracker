import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final url = Uri.parse('https://api.coincap.io/v2/assets');

    final response = await http.get(url);

    Map<String, dynamic> userMap = await jsonDecode(response.body);
    final data = <CryptoCoin>[];
    userMap['data'].forEach((v) {
      data.add(CryptoCoin.fromJson(v));
    });
    print('get data');
    return data;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final url = Uri.parse('https://api.coincap.io/v2/assets');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = await jsonDecode(response.body);
        final data = <CryptoCoin>[];
        userMap['data'].forEach((v) {
          data.add(CryptoCoin.fromJson(v));
        });
        print('get data');
        return data;
      }
      throw ('Get data failure');
    } on SocketException {
      throw const Text('No internet connection');
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

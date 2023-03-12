

import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  String? symbol;
  String? priceUsd;
  String? changePercent24Hr;

  CryptoCoin({
    this.symbol,
    this.priceUsd,
    this.changePercent24Hr,
  });

  CryptoCoin.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'] ?? '---';
    priceUsd = _getDouble(json['priceUsd'] ?? '---');
    changePercent24Hr = _getDouble(json['changePercent24Hr'] ?? '---');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['symbol'] = this.symbol;
    data['priceUsd'] = this.priceUsd;
    data['changePercent24Hr'] = this.changePercent24Hr;
    return data;
  }

  @override
  List<Object?> get props => [symbol, priceUsd, changePercent24Hr];

  String _getDouble(String str) {
    if (str == '---') {
      return str;
    }
    final fullDouble = double.parse(str);
    final string = fullDouble.toStringAsFixed(2);
    
    return string;
  }

  

  CryptoCoin copyWith(CryptoCoin coinsList, {
    String? symbol,
    String? priceUsd,
    String? changePercent24Hr,
  }) {
    return CryptoCoin(
      symbol: symbol ?? this.symbol,
      priceUsd: priceUsd ?? this.priceUsd,
      changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
    );
  }
}

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/crypto_list/crypto_coins_repository.dart';
import '../../../repositories/crypto_list/models/crypto_coin.dart';
part 'cubit_state.dart';

class CryptoListCubit extends Cubit<CryptoListState> {
  final CryptoCoinsRepository _cryptoCoinsRepository;

  CryptoListCubit(this._cryptoCoinsRepository) : super(CubitInitial());

  Future<void> getCryptoList() async {
    try {
      emit(CryptoListLoading());
      final coinsList = await _cryptoCoinsRepository.getCoinsList();
      emit(CryptoListLoaded(coinsList: coinsList));
    } catch (e) {
      emit(
        CryptoListError(message: e.toString()),
      );
    }
  }

  void updateCryptoList() {
    try {
      Timer.periodic(const Duration(seconds: 2), (timer) async {
        final coinsList = await _cryptoCoinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      });
    } catch (e) {
      emit(
        CryptoListError(message: e.toString()),
      );
    }
  }

 
}

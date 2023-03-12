part of 'cubit_cubit.dart';

abstract class CryptoListState extends Equatable {
  const CryptoListState();

  @override
  List<Object> get props => [];
}

class CubitInitial extends CryptoListState {
  @override
  List<Object> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinsList;

  const CryptoListLoaded({required this.coinsList});
  

  @override
  List<Object> get props => [coinsList];
}

class CryptoListError extends CryptoListState {
  final String message;
  const CryptoListError({required this.message});

  @override
  List<Object> get props => [message];
}

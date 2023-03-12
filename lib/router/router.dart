import '../features/crypto_history/view/crypto_history_screen.dart';
import '../features/crypto_list/view/crypto_list_screen.dart';

final routes = {
  '/': (context) =>  CryptoListScreen(),
  '/coin': (context) => const CryptoHistoryScreen(),
};
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cubit.dart';

class CoinSymbol extends StatefulWidget {
  CoinSymbol({required this.index, super.key});
  int index;
  @override
  State<CoinSymbol> createState() => _SymbolState();
}

class _SymbolState extends State<CoinSymbol> {
  @override
  Widget build(BuildContext context) {
    print('Build symbol');

    return BlocBuilder<CryptoListCubit, CryptoListState>(
      buildWhen: (previous, current) {
        if ((current as CryptoListLoaded).coinsList[widget.index].symbol !=
            (previous as CryptoListLoaded).coinsList[widget.index].symbol) {
          setState(() {});
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (state as CryptoListLoaded)
                  .coinsList[widget.index]
                  .symbol
                  .toString(),
              maxLines: 1,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              state.coinsList[widget.index].name.toString(),
              maxLines: 1,
              style:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.4)),
            ),
          ],
        );
      },
    );
  }
}

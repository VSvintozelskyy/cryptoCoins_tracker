
import 'package:coin_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit_cubit.dart';
import 'coin_price_usr.dart';

class CoinTile extends StatelessWidget {
  CoinTile({
   
    required this.index,
    Key? key,
  }) : super(key: key);

  
  int index;

  @override
  Widget build(BuildContext context) {
    print('Build tile');

    return Container(
      color: AppColors.mainContainer,
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CoinSymbol(index: index),
            ),
          ),
          CoinPriceUsd(index: index),
          CoinChangePercentPrice(index: index),
        ],
      ),
    );
  }
}

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
        return Text(
          (state as CryptoListLoaded).coinsList[widget.index].symbol ?? '---'.toString(),
          style: const TextStyle(fontSize: 24, color: Colors.white),
        );
      },
    );
  }
}



class CoinChangePercentPrice extends StatefulWidget {
  CoinChangePercentPrice({required this.index, super.key});

  int index;

  @override
  State<CoinChangePercentPrice> createState() => _ChangePercentPriceState();
}

class _ChangePercentPriceState extends State<CoinChangePercentPrice> {
  @override
  Widget build(BuildContext context) {
    print('Build changePercent');

    return BlocBuilder<CryptoListCubit, CryptoListState>(
      buildWhen: (previous, current) {
        if ((current as CryptoListLoaded)
                .coinsList[widget.index]
                .changePercent24Hr !=
            (previous as CryptoListLoaded)
                .coinsList[widget.index]
                .changePercent24Hr) {
          setState(() {});
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: Container(
            
            alignment: Alignment.centerLeft,
            height: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  (state as CryptoListLoaded)
                      .coinsList[widget.index]
                      .changePercent24Hr
                      .toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                )),
          ),
        );
      },
    );
  }
}

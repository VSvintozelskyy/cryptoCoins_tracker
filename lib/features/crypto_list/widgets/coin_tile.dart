
import 'package:coin_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit_cubit.dart';
import 'coin_change_percent_price.dart';
import 'coin_price_usr.dart';
import 'coin_symbol.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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






import 'package:coin_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cubit.dart';

class CoinPriceUsd extends StatefulWidget {
  CoinPriceUsd({required this.index, super.key});

  int index;

  @override
  State<CoinPriceUsd> createState() => _PriceUsdState();
}

class _PriceUsdState extends State<CoinPriceUsd> {
  double opacity = 0.0;
  Color color = Colors.red;
  String iconAsset = "assets/images/up-arrow.png";

  @override
  Widget build(BuildContext context) {
    print('Build price');

    return BlocBuilder<CryptoListCubit, CryptoListState>(
      buildWhen: (previous, current) {
        final prev =
            (previous as CryptoListLoaded).coinsList[widget.index].priceUsd;
        final cur =
            (current as CryptoListLoaded).coinsList[widget.index].priceUsd;
        if (cur != prev) {
          if (double.parse(cur!) > double.parse(prev!)) {
            setState(() {
              changePrice(Colors.green, "assets/images/up-arrow.png");
            });
          } else {
            setState(() {
              changePrice(Colors.red, "assets/images/down-arrow.png");
            });
          }

          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: Text(
                      (state as CryptoListLoaded)
                          .coinsList[widget.index]
                          .priceUsd
                          .toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 1),
                
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: color.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color.withOpacity(0.2)),
                      child: ImageIcon(
                        AssetImage(iconAsset),
                        color: color,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        );
      },
    );
  }

  void changePrice(Color col, String icon) {
    setState(() {
      color = col;
      iconAsset = icon;
      opacity = 1;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacity = 0.0;
      });
    });
  }
}

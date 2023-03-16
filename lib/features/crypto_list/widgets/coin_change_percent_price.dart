import 'package:coin_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cubit.dart';

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
    Color color = AppColors.mainContainer;
    String iconAsset = "assets/images/up-arrow.png";
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
        String changePercent = (state as CryptoListLoaded)
            .coinsList[widget.index]
            .changePercent24Hr
            .toString();
        if (changePercent != '') {
          if (double.parse(changePercent) >= 0) {
          color = Colors.green;
          iconAsset = "assets/images/up-arrow.png";
        }else{
          color = Colors.red;
          iconAsset = "assets/images/down-arrow.png";
        }
        }
        return Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            height: double.infinity,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Container(
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
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      changePercent,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18, color: color),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}

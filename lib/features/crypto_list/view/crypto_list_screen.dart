
import 'package:coin_tracker/features/crypto_list/cubit/cubit_cubit.dart';
import 'package:coin_tracker/features/crypto_list/widgets/coin_tile.dart';
import 'package:coin_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatelessWidget {
  CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _CryptoListCubit = BlocProvider.of<CryptoListCubit>(context);
    _CryptoListCubit.getCryptoList();
    _CryptoListCubit.updateCryptoList();
    print('Build list');

    return SafeArea(
      child: Scaffold(
        
        body: BlocBuilder<CryptoListCubit, CryptoListState>(
          buildWhen: (previous, current) {
            if (previous is CryptoListLoaded) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          color: AppColors.mainContainer,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                        ),
                        itemCount: state.coinsList.length,
                        itemBuilder: (context, i) {
                          return CoinTile(
                            index: i,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is CryptoListError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

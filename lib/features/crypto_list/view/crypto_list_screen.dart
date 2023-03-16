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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Expanded(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.dark,
                              blurRadius: 5,
                              offset: Offset(
                                0,
                                0,
                              ),
                            ),
                          ],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: AppColors.mainContainer,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                                Text(
                                  'price USD',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                                Text(
                                  'change 24h %',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ]),
                        ),
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

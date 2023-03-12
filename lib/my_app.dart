import 'package:coin_tracker/repositories/crypto_list/crypto_coins_repository.dart';
import 'package:coin_tracker/router/router.dart';
import 'package:coin_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/crypto_list/cubit/cubit_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CryptoListCubit>(
          create: (BuildContext context) =>
              CryptoListCubit(CryptoCoinsRepository()),
        ),
      ],
      child: MaterialApp(
        routes: routes,
        theme: theme,
      ),
    );
  }
}

import 'dart:async';

import 'package:crypto_coins_list/features/bloc/crypto_list_block.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I.registerSingleton(CryptoCoinsRepository()),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Crypto Coins List",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async { 
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, i) {
                  final price = state.coinsList[i].priceInUSD;

                  return ListTile(
                    leading: Image.network(state.coinsList[i].imageURL),
                    title: Text(
                      state.coinsList[i].coinName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      '\$$price',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/coins-list',
                        arguments: state.coinsList[i].coinName,
                      );
                    },
                  );
                },
              );
            }

            if (state is CryptoListFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Something went wrong"),
                    Text("Please try again later"),
                    SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () => _cryptoListBloc.add(LoadCryptoList()),
                      child: Text("Try again"),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

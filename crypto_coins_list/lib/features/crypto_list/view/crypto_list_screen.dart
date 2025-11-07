import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

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
      body: ListView.separated(
        itemCount: _cryptoCoinsList?.length ?? 0,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          final price = _cryptoCoinsList?[i].priceInUSD ?? 0;
          return ListTile(
            leading: Image.asset(
              'assets/png/bitcoing_no_background.png',
              height: 40,
              width: 40,
            ),
            title: Text(
              _cryptoCoinsList?[i].coinName ?? "...",
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
                arguments: _cryptoCoinsList?[i].coinName,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          _cryptoCoinsList = await CryptoCoinsRepository.getCoinsList();
          setState(() {});
        },
      ),
    );
  }
}

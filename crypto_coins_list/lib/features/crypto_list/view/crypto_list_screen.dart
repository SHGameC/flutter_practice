import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    const coinName = 'BitCoin';
    final block = CryptoCoinsRepository(cryptoCurrency: "BTC");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Crypto Coins List",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset(
              'assets/png/bitcoing_no_background.png',
              height: 40,
              width: 40,
            ),
            title: Text(
              coinName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              '\$150000',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              block.getCoinsList();
              Navigator.of(
                context,
              ).pushNamed('/coins-list', arguments: coinName);
            },
          );
        },
      ),
    );
  }
}

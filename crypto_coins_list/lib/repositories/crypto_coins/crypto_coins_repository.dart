import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  
  Future<List<CryptoCoin>> getCoinsList() async {

    final response = await Dio().get(
      "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX&tsyms=USD",
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
        .map(
          (e) => CryptoCoin(
            coinName: e.key,
            priceInUSD: (e.value as Map<String, dynamic>)['USD']['PRICE'],
            imageURL: 'https://www.cryptocompare.com/${(e.value as Map<String, dynamic>)['USD']['IMAGEURL']}',
          ),
        )
        .toList();
    debugPrint(cryptoCoinsList[0].imageURL);
    return cryptoCoinsList;
  }
}

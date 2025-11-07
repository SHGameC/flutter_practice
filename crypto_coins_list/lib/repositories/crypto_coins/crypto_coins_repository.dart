import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  CryptoCoinsRepository({required this.cryptoCurrency});

  final cryptoCurrency;

  Future<void> getCoinsList() async {
    final response = await Dio().get(
      "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$cryptoCurrency&tsyms=USD",
    );
    debugPrint(response.toString());
  }
}

import 'package:crypto_coins_list/features/app.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton(CryptoCoinsRepository);
  runApp(const CryptoCurrenciesListApp());
}

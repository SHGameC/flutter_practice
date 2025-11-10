import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  CryptoCoin({
    required this.imageURL,
    required this.coinName,
    required this.priceInUSD,
  });

  final String imageURL;
  final String coinName;
  final double priceInUSD;
  
  @override
  List<Object?> get props => [coinName, priceInUSD, imageURL];
}

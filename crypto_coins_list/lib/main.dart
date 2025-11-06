import 'package:crypto_coins_list/features/crypto_list/view/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 17, 17, 17),
        scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        dividerColor: const Color.fromARGB(15, 34, 34, 34),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
          iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          labelSmall: TextStyle(color: Colors.white70, fontSize: 14),
        ),

        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
      ),
      routes: {
        '/': (context) => CryptoListScreen(),
        '/coins-list': (context) => CryptoCoinScreen(),
      },
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      debugPrint('Did not pass an argument');
      return;
    }

    if (args is String && args != "") {
      coinName = args.toString();
    } else if (args == "") {
      debugPrint('No name was passed');
    } else {
      debugPrint('You did not pass a string');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          coinName ?? "No name was passed",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("USD"), Text("EUR"), Text("JNY")],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  late TextEditingController textEditingController;
  double result = 0;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(); // initialize the controller
  }

  @override
  void dispose() {
    textEditingController.dispose(); // clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(25),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Currency Converter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.toStringAsFixed(2),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Please enter amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final input = textEditingController.text.trim();
                if (kDebugMode) {
                  print(input);
                }

                double? usd = double.tryParse(input);
                if (usd != null) {
                  setState(() {
                    result = usd * 1734;
                  });

                  if (kDebugMode) {
                    print("Converted: $result");
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid input. Please enter a valid number.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(
                elevation: 15,
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                fixedSize: const Size(double.infinity, 50),
              ),
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}

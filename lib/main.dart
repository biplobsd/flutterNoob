import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isVisible = true;

  void isSee() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Spread Operator"),
          ),
          body: Center(
            child: Column(
              children: [
                ...Iterable.generate(11).map(
                  (e) => ElevatedButton(
                    onPressed: () {},
                    child: Text("Button $e"),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

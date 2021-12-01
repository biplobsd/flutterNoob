import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.purpleAccent,
        systemNavigationBarColor: Colors.blueAccent),
  );
  runApp(const MyApp());
}

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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text("Spread Operator"),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  ...Iterable.generate(66).map(
                    (e) => ElevatedButton(
                      onPressed: () {},
                      child: Text("Button $e"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

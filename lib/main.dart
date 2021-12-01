import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text("ClipRRect"),
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.redAccent,
                  width: 250,
                  height: 250,
                ),
              ),
            )),
      );
}

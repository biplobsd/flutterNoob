import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("FittedBox"),
          ),
          body: Center(
            child: Container(
              height: 100,
              color: Colors.black,
              child: const FittedBox(
                child: Center(
                    child: Text(
                  "FittedBox",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ),
      );
}

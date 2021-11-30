import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Wrap"),
          ),
          body: Center(
            child: Wrap(
              children: [
                ...Iterable.generate(10).map(
                  (i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Button ${i + 1}"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
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
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text("Sliver"),
                floating: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ...Iterable.generate(50)
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      color: Colors.lightBlueAccent,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

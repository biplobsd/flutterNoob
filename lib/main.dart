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
            title: const Text("SnackBar"),
          ),
          body: Column(
            children: [
              Center(
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("This is the SnackBar"),
                          ),
                        );
                        isSee();
                      },
                      child: Visibility(
                          child: Image.asset("assets/splash.png"),
                          visible: isVisible),
                    );
                  },
                ),
              ),
              Visibility(
                  visible: !isVisible,
                  child: ElevatedButton(
                    onPressed: () {
                      isSee();
                    },
                    child: const Text("Resee"),
                  ))
            ],
          ),
        ),
      );
}

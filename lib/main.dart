import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

Future<List<String>> getData() async {
  await Future.delayed(
    const Duration(
      seconds: 2,
    ),
  );
  return [...Iterable.generate(10).map((e) => "New Value $e").toList()];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Future Builder"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Show"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Nice(),
              ),
            ),
          ),
        ),
      );
}

class Nice extends StatelessWidget {
  const Nice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot<List<String>> snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(
                              snapshot.data!.length,
                              (index) => Text(
                                snapshot.data![index],
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Back"),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      );
}

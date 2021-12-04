import 'package:flutter/material.dart';

void main() => runApp(const Search());

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> words = ['henten', 'ai', 'two'];
  final amountController = TextEditingController();

  late List<String> searchedWords = words;
  List<String> search(String input) {
    return words
        .where(
          (element) => element.contains(input),
        )
        .toList();
  }

  void searched({String dataInput = ""}) {
    if (dataInput.isEmpty) {
      dataInput = amountController.text;
    }
    setState(() {
      searchedWords = search(dataInput);
      // print('changed');
      // print(words);
    });
  }

  void _add() {
    words.add(amountController.text);
    amountController.text = '';
    searched();
  }

  void _remove(index) {
    words.remove(words[index]);
    searched();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple List Add Remove Search'),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListReturn(_remove, viewList: searchedWords),
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Search & Add', fillColor: Colors.purple),
              onChanged: (String value) async {
                searched(dataInput: value);
              },
              onSubmitted: (_) => _add(),
              // onTap: searched,
              controller: amountController,
            ),
            ElevatedButton(
              onPressed: _add,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class ListReturn extends StatelessWidget {
  final List<String> viewList;
  final Function setHandler;
  const ListReturn(this.setHandler, {Key? key, required this.viewList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewList.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setHandler(index);
          },
        ),
        title: Text(
          viewList[index],
        ),
      ),
    );
  }
}

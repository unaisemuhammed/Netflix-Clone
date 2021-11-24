import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTilers extends StatefulWidget {
  const ListTilers({Key? key}) : super(key: key);

  @override
  _ListTilersState createState() => _ListTilersState();
}

class _ListTilersState extends State<ListTilers> {
  final List<bool> _selected = List.generate(20, (i) => false);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            color: _selected[i] ? Colors.blue : null,
            child: ListTile(
              title: const Text('Item'),
              leading: IconButton(icon: const Icon(Icons.add), onPressed: () { setState(() => _selected[i] = !_selected[i]);},
              ),
            ),
          );
        },
      ),
    );
  }
}

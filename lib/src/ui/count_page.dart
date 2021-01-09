import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/component/count_view.dart';
import 'package:flutter_provider_sample/src/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key key}) : super(key: key);
  CounterProvider countProvider;

  @override
  Widget build(BuildContext context) {
    countProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counting Provider"),
      ),
      body: CountView(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => countProvider.add(),
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => countProvider.subtract(),
          ),
        ],
      ),
    );
  }
}

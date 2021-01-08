import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/component/count_view.dart';
import 'package:flutter_provider_sample/src/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterProvider countProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
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

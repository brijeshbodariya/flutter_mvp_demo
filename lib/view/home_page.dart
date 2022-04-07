import 'package:flutter/material.dart';
import 'package:flutter_mvp_demo/model/counter_model.dart';
import 'package:flutter_mvp_demo/presenter/presenter.dart';
import 'package:flutter_mvp_demo/view/counter.dart';

class HomePage extends StatefulWidget {
  final Presenter? presenter;
  final String? title;

  const HomePage(this.presenter, {Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> implements Counter {
  CounterModel? _viewModel;

  @override
  void initState() {
    super.initState();
    widget.presenter!.counterView = this;
  }

  @override
  void refreshCounter(CounterModel viewModel) {
    setState(() {
      _viewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Click buttons to add and substract.",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    widget.presenter!.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Text(
                  '${_viewModel?.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                FloatingActionButton(
                  onPressed: () {
                    widget.presenter!.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

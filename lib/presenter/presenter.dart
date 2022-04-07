import 'package:flutter_mvp_demo/model/counter_model.dart';
import 'package:flutter_mvp_demo/view/counter.dart';

class Presenter {
  void incrementCounter() {}

  void decrementCounter() {}

  set counterView(Counter value) {}
}

class BasicCounterPresenter implements Presenter {
  CounterModel? _counterViewModel;
  Counter? _counterView;

  BasicCounterPresenter() {
    _counterViewModel = CounterModel(0);
  }

  @override
  void incrementCounter() {
    _counterViewModel!.counter++;
    _counterView!.refreshCounter(_counterViewModel!);
  }

  @override
  void decrementCounter() {
    _counterViewModel!.counter--;
    _counterView!.refreshCounter(_counterViewModel!);
  }

  @override
  set counterView(Counter value) {
    _counterView = value;
    _counterView!.refreshCounter(_counterViewModel!);
  }
}

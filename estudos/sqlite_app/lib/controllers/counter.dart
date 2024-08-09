import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  var counter = 0;

  //We can also made de @computed
  @computed
  bool get isEven => counter % 2 == 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    counter--;
  }
}

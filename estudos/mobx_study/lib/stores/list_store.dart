import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  _ListStore() {
    autorun((_) {
      print("TodoValue?");
      print(_name);
    });
  }

  @observable
  late Database db;

  @observable
  String? _name;

  @computed
  String get name => _name ?? '';

  @action
  uptadeName({required String name}) {
    this._name = name;
  }
}

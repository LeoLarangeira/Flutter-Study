// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: '_ListStore.name'))
      .value;

  late final _$dbAtom = Atom(name: '_ListStore.db', context: context);

  @override
  Database get db {
    _$dbAtom.reportRead();
    return super.db;
  }

  bool _dbIsInitialized = false;

  @override
  set db(Database value) {
    _$dbAtom.reportWrite(value, _dbIsInitialized ? super.db : null, () {
      super.db = value;
      _dbIsInitialized = true;
    });
  }

  late final _$_nameAtom = Atom(name: '_ListStore._name', context: context);

  @override
  String? get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String? value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  dynamic uptadeName({required String name}) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.uptadeName');
    try {
      return super.uptadeName(name: name);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
db: ${db},
name: ${name}
    ''';
  }
}

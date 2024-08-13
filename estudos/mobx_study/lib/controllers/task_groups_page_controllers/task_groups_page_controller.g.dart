// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_groups_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskGroupsPageController on _TaskGroupsPageController, Store {
  late final _$loadingAtom =
      Atom(name: '_TaskGroupsPageController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$taskGroupsAtom =
      Atom(name: '_TaskGroupsPageController.taskGroups', context: context);

  @override
  List<TaskGroup> get taskGroups {
    _$taskGroupsAtom.reportRead();
    return super.taskGroups;
  }

  @override
  set taskGroups(List<TaskGroup> value) {
    _$taskGroupsAtom.reportWrite(value, super.taskGroups, () {
      super.taskGroups = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TaskGroupsPageController.getData', context: context);

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
taskGroups: ${taskGroups}
    ''';
  }
}

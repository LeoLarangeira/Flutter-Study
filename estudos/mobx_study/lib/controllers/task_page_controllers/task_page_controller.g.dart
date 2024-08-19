// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskPageController on _TaskPageController, Store {
  late final _$loadingAtom =
      Atom(name: '_TaskPageController.loading', context: context);

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

  late final _$tasksAtom =
      Atom(name: '_TaskPageController.tasks', context: context);

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_TaskPageController.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$txtTaskNameAtom =
      Atom(name: '_TaskPageController.txtTaskName', context: context);

  @override
  TextEditingController get txtTaskName {
    _$txtTaskNameAtom.reportRead();
    return super.txtTaskName;
  }

  @override
  set txtTaskName(TextEditingController value) {
    _$txtTaskNameAtom.reportWrite(value, super.txtTaskName, () {
      super.txtTaskName = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TaskPageController.getData', context: context);

  @override
  Future<dynamic> getData(int groupId) {
    return _$getDataAsyncAction.run(() => super.getData(groupId));
  }

  late final _$validateFormAndCreateTaskAsyncAction = AsyncAction(
      '_TaskPageController.validateFormAndCreateTask',
      context: context);

  @override
  Future<dynamic> validateFormAndCreateTask(BuildContext context) {
    return _$validateFormAndCreateTaskAsyncAction
        .run(() => super.validateFormAndCreateTask(context));
  }

  late final _$_TaskPageControllerActionController =
      ActionController(name: '_TaskPageController', context: context);

  @override
  void createTask(BuildContext context) {
    final _$actionInfo = _$_TaskPageControllerActionController.startAction(
        name: '_TaskPageController.createTask');
    try {
      return super.createTask(context);
    } finally {
      _$_TaskPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
tasks: ${tasks},
formKey: ${formKey},
txtTaskName: ${txtTaskName}
    ''';
  }
}

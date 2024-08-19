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

  late final _$formKeyAtom =
      Atom(name: '_TaskGroupsPageController.formKey', context: context);

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

  late final _$txtTaskGroupNameAtom = Atom(
      name: '_TaskGroupsPageController.txtTaskGroupName', context: context);

  @override
  TextEditingController get txtTaskGroupName {
    _$txtTaskGroupNameAtom.reportRead();
    return super.txtTaskGroupName;
  }

  @override
  set txtTaskGroupName(TextEditingController value) {
    _$txtTaskGroupNameAtom.reportWrite(value, super.txtTaskGroupName, () {
      super.txtTaskGroupName = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TaskGroupsPageController.getData', context: context);

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$validateFormAndCreateTaskGroupAsyncAction = AsyncAction(
      '_TaskGroupsPageController.validateFormAndCreateTaskGroup',
      context: context);

  @override
  Future<dynamic> validateFormAndCreateTaskGroup(BuildContext context) {
    return _$validateFormAndCreateTaskGroupAsyncAction
        .run(() => super.validateFormAndCreateTaskGroup(context));
  }

  late final _$_TaskGroupsPageControllerActionController =
      ActionController(name: '_TaskGroupsPageController', context: context);

  @override
  void createTaskGroup(BuildContext context) {
    final _$actionInfo = _$_TaskGroupsPageControllerActionController
        .startAction(name: '_TaskGroupsPageController.createTaskGroup');
    try {
      return super.createTaskGroup(context);
    } finally {
      _$_TaskGroupsPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
formKey: ${formKey},
taskGroups: ${taskGroups},
txtTaskGroupName: ${txtTaskGroupName}
    ''';
  }
}

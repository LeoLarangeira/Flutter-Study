import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class TodoEntity extends Equatable {
  late int? id;
  final String name;

  TodoEntity({this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

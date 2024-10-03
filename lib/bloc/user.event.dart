import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {
  final int userId;

  FetchUser(this.userId);

  @override
  List<Object> get props => [userId];
}
class FetchUserList extends UserEvent {}
import 'package:equatable/equatable.dart';
import 'package:mvvm/models/users.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final Users user;

  UserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class UserListLoaded extends UserState {
  final List<Users> users;

  UserListLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});

  @override
  List<Object> get props => [message];
}

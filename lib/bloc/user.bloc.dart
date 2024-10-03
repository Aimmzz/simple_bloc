import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/models/users.dart';
import 'package:mvvm/service/user_service.dart';
import 'user.event.dart';
import 'user.state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUser>((event, emit) async {
      emit(UserLoading()); // State loading
      try {
        Users? user = await UserService.getUserFromApi(event.userId);
        if (user != null) {
          emit(UserLoaded(user: user));  // State loaded with user data
        } else {
          emit(UserError(message: 'Failed to load user'));
        }
      } catch (e) {
        emit(UserError(message: 'Error: $e'));
      }
    });

    on<FetchUserList>((event, emit) async {
      emit(UserLoading()); // State loading
      try {
        List<Users> users = await UserService.getUsersFromApi();
        emit(UserListLoaded(users: users));
      } catch (e) {
        emit(UserError(message: 'Error: $e'));
      }
    });
  }
}

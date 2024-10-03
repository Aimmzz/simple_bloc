import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/bloc/user.bloc.dart';
import 'package:mvvm/bloc/user.event.dart';
import 'package:mvvm/bloc/user.state.dart';

class UserPage extends StatelessWidget {
  final int userId;

  const UserPage({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUser(userId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListTile(
                title: Text('${state.user.firstName} ${state.user.lastName}'),
                subtitle: Text(state.user.email),
                leading: Image.network(state.user.avatar),
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Please wait...'));
            }
          },
        ),
      ),
    );
  }
}

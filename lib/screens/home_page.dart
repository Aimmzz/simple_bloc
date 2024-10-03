import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/bloc/user.bloc.dart';
import 'package:mvvm/bloc/user.event.dart';
import 'package:mvvm/bloc/user.state.dart';
import 'package:mvvm/screens/user_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUserList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserListLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.firstName + " " + user.lastName),
                    subtitle: Text(user.email),
                    leading: Image.network(user.avatar),
                    onTap: () {
                      // Navigate to UserPage when user is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(userId: int.parse(user.id)),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Please wait...'));
            }
          },
        ),
      ),
    );
  }
}

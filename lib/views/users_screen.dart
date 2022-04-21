import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/users_api.dart';
import '../blocs/users/user_events.dart';
import '../blocs/users/users_bloc.dart';
import '../blocs/users/users_states.dart';
import '../repository/user_repository.dart';
import 'components/user_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc =
        UserBloc(userRepository: UserRepository(userApi: UserApi()));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  userBloc.add(LoadUserEvent());
                  print("Pressed");
                },
                child: Text("Fetch users")),
            BlocBuilder(
                bloc: userBloc,
                builder: ((context, UserState state) {
                  if (state is UserLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is UserLoadedState) {
                    var users = state.users;
                    print(users);
                    // return Text('${users.length}');
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (_, index) {
                          return getUserCard(users[index]);
                        });
                  } else if (state is UserLoadingErrorState) {
                    return Text("Error loading users");
                  } else {
                    return Text("--");
                  }
                })),
          ],
        ),
      ),
    );
  }
}

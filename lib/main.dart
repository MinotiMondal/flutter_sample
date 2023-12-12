import 'package:flutter/material.dart';
import 'package:sample/blocs/app_blocs.dart';
import 'package:sample/blocs/app_event.dart';
import 'package:sample/blocs/app_states.dart';
import 'package:sample/models/user_Model.dart';
import 'package:sample/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  RepositoryProvider.value(value: UserRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Bloc App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].firstname,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userList[index].lastname,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avator)),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}

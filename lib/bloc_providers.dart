import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/bloc/login_bloc.dart';
import 'login/repository/login_repository.dart';

class ParentBlocProviders extends StatelessWidget {
  final Widget child;

  const ParentBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(loginRepo: LoginRepoImpl()),
        ),
      ],
      child: child,
    );
  }
}

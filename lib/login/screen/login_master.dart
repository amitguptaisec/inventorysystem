import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorysystem/login/screen/login_page.dart';

import '../../dashboardscreen/screen/dashboard_screen.dart';
import '../bloc/login_bloc.dart';
import '../repository/login_repository.dart';

class LoginMaster extends StatefulWidget {
  const LoginMaster({super.key});

  @override
  State<LoginMaster> createState() => _LoginMasterState();
}

class _LoginMasterState extends State<LoginMaster> {
  Widget dynamicContent = Container();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(loginRepo: LoginRepoImpl()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessstate) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => SimpleDashboardScreen()),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {}
            if (state is LoginLoadingState) {
              Center(child: CircularProgressIndicator());
            }
            if (state is LoginFailedState) {}
            return LoginScreen();
          },
        ),
      ),
    );
  }
}

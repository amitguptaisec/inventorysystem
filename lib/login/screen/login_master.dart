import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorysystem/login/screen/login_page.dart';
import 'package:inventorysystem/theme/app_colors.dart';

import '../../dashboardscreen/screen/dashboard_screen.dart';
import '../../utils/customsnackbar.dart';
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
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(loginRepo: LoginRepoImpl()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessstate) {
              if (state.loginResp.status == 200) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SimpleDashboardScreen()),
                );
              } else {
                showAppSnack(
                  context,
                  state.loginResp.message.toString(),
                  color: AppColors.error,
                );
              }
            }
            if (state is LoginFailedState) {
              showAppSnack(
                context,
                state.message.toString(),
                color: AppColors.error,
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {}
              if (state is LoginLoadingState) {
               return Center(child: CircularProgressIndicator());
              }
      
              return LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}

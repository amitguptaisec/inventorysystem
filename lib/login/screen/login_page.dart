import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dashboardscreen/screen/dashboard_screen.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_text_widget.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Inventory System",
              textsyle: AppTextStyles.bold26txtsecd,
            ),
            SizedBox(height: 40),
            CustomTextField(
              hint: '',
              labelText: "Username",
              border: OutlineInputBorder(),
              controller: _usernameCtl,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hint: '',
              obscureText: true,
              labelText: "Password",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.visibility),
              controller: _passwordCtl,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textLight,
              ),
              onPressed: () {
                bloc.add(
                  LoginPageEvent(
                    userId: _usernameCtl.text,
                    pasword: _passwordCtl.text,
                  ),
                );
            //      Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (_) => SimpleDashboardScreen()),
            // );
              },
              child: Text("LOGIN", style: AppTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}

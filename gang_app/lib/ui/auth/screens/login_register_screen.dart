import 'package:flutter/material.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/ui/auth/screens/login_screen.dart';
import 'package:gang_app/ui/auth/screens/register_screen.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: TabBar(
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
              indicatorColor: AppColors.secondary[100],
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: Text("Login",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Tab(
                  icon: Text("Registrar",
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
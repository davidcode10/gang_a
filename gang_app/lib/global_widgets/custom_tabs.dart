import 'package:flutter/material.dart';
import 'package:gang_app/ui/auth/screens/login_screen.dart';
import 'package:gang_app/ui/auth/screens/register_screen.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xff8FD974),
                bottom: const TabBar(
                    indicatorColor: Color(0xff8FD974),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                          icon: Text("Login",
                              style: TextStyle(
                                  color: Color(0xff434343),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600))),
                      Tab(
                          icon: Text("Register",
                              style: TextStyle(
                                  color: Color(0xff434343),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)))
                    ])),
            body: TabBarView(children: [LoginScreen(), RegisterScreen()])));
  }
}

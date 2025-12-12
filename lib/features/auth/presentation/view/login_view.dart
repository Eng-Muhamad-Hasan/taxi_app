import 'package:flutter/material.dart';

import '../widget/login_view_widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}

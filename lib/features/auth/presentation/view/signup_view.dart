import 'package:flutter/material.dart';
import 'package:taxi_app/features/auth/presentation/widget/signup_view_widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignupViewBody()));
  }
}

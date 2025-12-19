import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/core/services/get_it_service.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';
import 'package:taxi_app/features/auth/presentation/cubit/login-cubit/login_cubit.dart';
import '../widget/login_view_widget/login_view_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: const Scaffold(body: SafeArea(child: LoginViewConsumer())),
    );
  }
}

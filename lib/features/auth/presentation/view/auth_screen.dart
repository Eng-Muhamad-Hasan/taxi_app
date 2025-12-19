import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/core/services/get_it_service.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';
import 'package:taxi_app/features/auth/presentation/cubit/auth-cubit/auth_cubit.dart';
import '../widget/auth_screen_widget/auth_screen_consumer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: const Scaffold(body: SafeArea(child: AuthScreenConsumer())),
    );
  }
}

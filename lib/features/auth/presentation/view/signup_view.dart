import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/core/services/get_it_service.dart';
import 'package:taxi_app/features/auth/presentation/cubit/signup-cubit/signup_cubit.dart';
import '../../domain/repo/auth_repo.dart';
import '../widget/signup_view_widget/signup_view_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: const Scaffold(body: SafeArea(child: SignUpViewConsumer())),
    );
  }
}

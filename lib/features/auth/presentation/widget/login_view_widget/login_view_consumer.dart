import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/utils/app_router.dart';

import '../../../../../core/functions/show_log_snack_bar.dart';
import '../../../../../core/shared/custom_loading_indicator.dart';
import '../../cubit/login-cubit/login_cubit.dart';
import 'login_view_body.dart';

class LoginViewConsumer extends StatelessWidget {
  const LoginViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          //# logic to navigate to home screen
          context.goNamed(AppRouter.kHomeView);
        } else if (state is LoginFailure) {
          showLogSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          isLoading: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}

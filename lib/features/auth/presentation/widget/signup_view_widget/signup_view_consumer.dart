import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import '../../../../../core/functions/show_log_snack_bar.dart';
import '../../../../../core/shared/custom_loading_indicator.dart';
import '../../cubit/signup-cubit/signup_cubit.dart';
import 'signup_view_body.dart';

class SignUpViewConsumer extends StatelessWidget {
  const SignUpViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pushReplacementNamed(AppRouter.kLoginView);
        } else if (state is SignupFailure) {
          showLogSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          isLoading: state is SignupLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}

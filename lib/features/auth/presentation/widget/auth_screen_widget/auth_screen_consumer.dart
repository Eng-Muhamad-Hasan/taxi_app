import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/functions/show_log_snack_bar.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import '../../../../../core/shared/custom_loading_indicator.dart';
import '../../cubit/auth-cubit/auth_cubit.dart';
import 'auth_screen_body.dart';

class AuthScreenConsumer extends StatelessWidget {
  const AuthScreenConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          //# todo: navigate to home screen
          context.goNamed(AppRouter.kHomeView);
        } else if (state is AuthFailure) {
          showLogSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          isLoading: state is AuthLoading,
          child: const AuthScreenBody(),
        );
      },
    );
  }
}

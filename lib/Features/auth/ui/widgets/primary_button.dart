import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_state.dart';
import 'package:ieee/core/constant/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.red,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 130),
            shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(2),
            ),
          ),
          child: (state is AuthLoading)
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColor.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(color: AppColor.white, fontSize: 16),
                ),
        );
      },
    );
  }
}

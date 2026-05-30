import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/custom_button_google.dart';
import 'package:ieee/Features/auth/ui/widgets/custom_password.dart';
import 'package:ieee/Features/auth/ui/widgets/custom_textfield.dart';
import 'package:ieee/Features/auth/ui/widgets/primary_button.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_state.dart';
import 'package:ieee/core/constant/app_color.dart';
import 'package:ieee/core/helpers/validator.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthCubit _authCubit;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " THE GAZETTE ",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: AppColor.babyred, thickness: 1),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 610,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.babyred,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Access your subscription and saved stories.",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      CustomTextfield(
                        hintText: "name@example.com",
                        labelText: "EMAIL ADDRESS",
                        controller: _emailController,

                        validator: (value) {
                          AppValidators.EmailValidator(value);
                          return null;
                        },
                      ),
                      CustomPassword(
                        label: 'PASSWORD',
                        hintText: '••••••••',
                        controller: _passwordController,
                        validator: (value) {
                          AppValidators.PasswordValidator(value);
                          return null;
                        },
                      ),

                      // SizedBox(height: 0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColor.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutesNamed.home_screen,
                            );
                          } else if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Log in failed")),
                            );
                          }
                        },
                        child: PrimaryButton(
                          text: "LOG IN",
                          onPressed: () {
                            _authCubit.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColor.babyred,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "OR CONTINUE WITH",
                              style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColor.babyred,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),

                      CustomButtonGoogle(text: 'Google', onPressed: () {}),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: AppColor.babyred, thickness: .5),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New to The Gazette?",
                            style: TextStyle(
                              color: AppColor.brown,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutesNamed.sign_up_screen,
                              );
                            },
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                color: AppColor.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

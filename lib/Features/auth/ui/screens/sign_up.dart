import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/ui/widgets/custom_password.dart';
import 'package:ieee/Features/auth/ui/widgets/custom_textfield.dart';
import 'package:ieee/Features/auth/ui/widgets/primary_button.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_cubit.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_state.dart';
import 'package:ieee/core/helpers/validator.dart';
import 'package:ieee/core/routes/app_route_named.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final AuthCubit _authCubit;
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Join the conversation.",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "In-depth reporting and rigorous analysis, delivered to your inbox.",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                hintText: "Joudy sami",
                labelText: "Full Name",
                controller: _nameController,
                validator: (value) {
                  AppValidators.NameValidator(value);
                  return null;
                },
              ),
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
              CustomPassword(
                hintText: "••••••••",
                label: "CONFIRM PASSWORD",
                controller: _confirmPasswordController,
                validator: (value) {
                  AppValidators.ConfirmPasswordValidator(
                    value,
                    _passwordController.text,
                  );
                  return null;
                },
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Register successfull")),
                    );
                    Navigator.pushNamed(context, AppRoutesNamed.login_screen);
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Register failed")));
                    Navigator.pushNamed(context, AppRoutesNamed.login_screen);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    text: "CREATE ACCOUNT",
                    onPressed: () {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Passwords do not match")),
                        );
                        return;
                      }
                      _authCubit.register(
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

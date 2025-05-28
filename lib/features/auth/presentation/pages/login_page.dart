import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/utils/custom_button.dart';
import 'package:template/core/utils/custom_text_form_field.dart';
import 'package:template/core/utils/validators.dart';
import 'package:template/features/auth/domain/entities/login_entity.dart';
import 'package:template/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:template/features/auth/presentation/blocs/auth_event.dart';
import 'package:template/features/auth/presentation/blocs/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context1, state) {
          if (state is LoginSuccess) {
            context1.pushNamed('home');
            ScaffoldMessenger.of(
              context1,
            ).showSnackBar(const SnackBar(content: Text("Login Successful")));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.only(top: 60, bottom: 40),
              children: [
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomFilledButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final loginEntity = LoginEntity(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        context.read<AuthBloc>().add(
                          LoginRequested(loginEntity),
                        );
                      }
                    },
                    isLoading: isLoading,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/utils/custom_button.dart';
import 'package:template/core/utils/custom_text_form_field.dart';
import 'package:template/core/utils/validators.dart';
import 'package:template/features/auth/domain/entities/user_entity.dart';
import 'package:template/features/auth/presentation/blocs/auth_event.dart';
import 'package:template/features/auth/presentation/blocs/auth_state.dart';

import '../blocs/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Sign up successful')));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Name',
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _phoneController,
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                  validator:
                      (value) => Validators.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                ),
                const SizedBox(height: 20),
                CustomFilledButton(
                  text: 'Sign Up',
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final user = UserEntity(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        phone: _phoneController.text,
                      );
                      context.read<AuthBloc>().add(SignUpRequested(user));
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

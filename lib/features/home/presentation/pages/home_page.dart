import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/config/router/guards.dart';
import 'package:template/config/router/routes.dart';
import 'package:template/core/utils/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CustomFilledButton(
              text: 'Log Out',
              onPressed: () async {
                await AuthService.logout();
                context.go(AppRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:Ecommerce/core/widgets/custom_app_bar.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: const SignupViewBody(),
    );
  }
}

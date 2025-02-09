import 'package:Ecommerce/core/widgets/custom_app_bar.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: const SigninViewBody(),
    );
  }
}

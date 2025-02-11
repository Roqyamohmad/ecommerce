import 'package:Ecommerce/constants.dart';
import 'package:Ecommerce/core/unitls/app_colors.dart';
import 'package:Ecommerce/core/unitls/app_images.dart';
import 'package:Ecommerce/core/unitls/app_text_styles.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/custom_text_field.dart';
import 'package:Ecommerce/core/widgets/password_field.dart';
import 'package:Ecommerce/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizintalPadding,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          onPressed: () {
                            context.read<SigninCubit>().signinWithApple();
                          },
                          image: Assets.imagesApplIcon,
                          title: 'تسجيل بواسطة أبل',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    )
                  : const SizedBox(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithFacebook();
                },
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

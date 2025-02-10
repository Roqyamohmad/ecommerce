import 'package:Ecommerce/constants.dart';
import 'package:Ecommerce/core/unitls/app_colors.dart';
import 'package:Ecommerce/core/unitls/app_images.dart';
import 'package:Ecommerce/core/unitls/app_text_styles.dart';
import 'package:Ecommerce/core/widgets/custom_button.dart';
import 'package:Ecommerce/core/widgets/custom_text_field.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:Ecommerce/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizintalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xFFC9CECF),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {
                //if (formKey.currentState!.validate()) {
                //  formKey.currentState!.save();

                //  context.read<SigninCubit>().signin(email, password);
                //} else {
                //  autovalidateMode = AutovalidateMode.always;
                //setState(() {});
                // }
              },
              text: 'إنشاء حساب جديد',
            ),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}

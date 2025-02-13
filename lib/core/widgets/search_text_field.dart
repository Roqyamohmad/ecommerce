import 'package:Ecommerce/core/unitls/app_images.dart';
import 'package:Ecommerce/core/unitls/app_text_styles.dart';
import 'package:Ecommerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.imagesSearchIcon),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesFilter,
              ),
            ),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: 'ابحث عن.......',
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }
}

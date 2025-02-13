import 'package:Ecommerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:Ecommerce/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: MainViewBody()),
    );
  }
}

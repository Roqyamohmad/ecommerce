import 'package:flutter/material.dart';

import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: [
        const HomeView(),
      ],
    );
  }
}

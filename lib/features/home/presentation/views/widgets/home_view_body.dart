import 'package:Ecommerce/constants.dart';
import 'package:Ecommerce/core/widgets/search_text_field.dart';
import 'package:Ecommerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:Ecommerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:Ecommerce/features/home/presentation/views/widgets/featured_list.dart';
import 'package:Ecommerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: kTopPaddding,
                ),
                CustomHomeAppBar(),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          ProductsGridView(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/cummon_widget/shopping_app_appbar.dart';
import 'package:sprints_shopping_app/features/home/ui/widgets/featured_products_widget.dart';
import 'package:sprints_shopping_app/generated/l10n.dart';

import '../widgets/hot_offers_widget.dart';
import '../widgets/shop_our_collection_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingAppAppbar(
        text: S.of(context).ourProducts,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              FeaturedProductsWidget(),
              SizedBox(height: 20),

              ShopOurCollectionWidget(),
              SizedBox(height: 20),
              HotOffersWidget(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

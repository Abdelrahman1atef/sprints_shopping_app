import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';
import 'package:sprints_shopping_app/gen/colors.gen.dart';
import 'package:sprints_shopping_app/gen/assets.gen.dart';

import '../../../../generated/l10n.dart';

class ProductModel {
  final String image;
  final String title;
  final double price;
  final String description;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

class ShopOurCollectionWidget extends StatelessWidget {
  ShopOurCollectionWidget({super.key});

  final List<ProductModel> products = [
    ProductModel(
      image: Assets
          .images
          .image1
          .path, // Using existing image as placeholder
      title: "MacBook Pro 16\"",
      price: 2399.0,
      description: "Professional laptop for power users",
    ),
    ProductModel(
      image: Assets.images.pageViewImage1.path,
      title: "Wireless Headphones",
      price: 299.0,
      description: "Premium audio experience",
    ),
    ProductModel(
      image: Assets.images.pageViewImage2.path,
      title: "Smart Watch",
      price: 399.0,
      description: "Advanced fitness tracking",
    ),
    ProductModel(
      image: Assets.images.pageViewImage3.path,
      title: "Designer Backpack",
      price: 129.0,
      description: "Stylish and functional",
    ),
    ProductModel(
      image: Assets.images.shopOurCollectionImage1.path,
      title: "Premium Keyboard",
      price: 199.0,
      description: "Mechanical gaming keyboard",
    ),
    ProductModel(
      image: Assets.images.shopOurCollectionImage2.path,
      title: "Wireless Mouse",
      price: 79.0,
      description: "Ergonomic design",
    ),
  ];

  void _addToCart(
    BuildContext context,
    ProductModel product,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} added to the cart'),
        backgroundColor: ColorName.primaryColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            // TODO: Implement undo functionality
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).shopOurCollection,
          style: TextStyles.normalText.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Responsive GridView
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                childAspectRatio: 0.7, // Card aspect ratio
                crossAxisSpacing: 16, // Horizontal spacing
                mainAxisSpacing: 16, // Vertical spacing
              ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return _buildProductCard(context, product);
          },
        ),
      ],
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    ProductModel product,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 9, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Product Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    product.title,
                    style: TextStyles.primeText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Product Description
                  Text(
                    product.description,
                    style: TextStyles.normalText.copyWith(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Price and Add to Cart
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: TextStyles.primeText
                            .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorName.primaryColor,
                            ),
                      ),

                      // Add to Cart Button
                      GestureDetector(
                        onTap: () =>
                            _addToCart(context, product),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorName.primaryColor,
                            borderRadius:
                                BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';
import 'package:sprints_shopping_app/gen/colors.gen.dart';

import '../../../../generated/l10n.dart';

class HotOfferModel {
  final String title;
  final String description;
  final String discount;

  HotOfferModel({
    required this.title,
    required this.description,
    required this.discount,
  });
}

class HotOffersWidget extends StatelessWidget {
  HotOffersWidget({super.key});

  final List<HotOfferModel> hotOffers = [
    HotOfferModel(
      title: "50% Off Electronics",
      description: "Limited time offer on all tech gadgets",
      discount: "50% OFF",
    ),
    HotOfferModel(
      title: "Free Shipping Weekend",
      description:
          "No delivery charges on orders above \$50",
      discount: "FREE SHIP",
    ),
    HotOfferModel(
      title: "Buy 2 Get 1 Free",
      description:
          "On selected accessories and peripherals",
      discount: "B2G1",
    ),
    HotOfferModel(
      title: "Student Discount",
      description: "Extra 20% off with valid student ID",
      discount: "20% OFF",
    ),
    HotOfferModel(
      title: "Bundle Deals",
      description: "Save more when you buy complete setups",
      discount: "BUNDLE",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with fire emoji
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).hotOffers,
              style: TextStyles.normalText.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              " 🔥",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Vertically scrollable ListView
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          itemCount: hotOffers.length,
          itemBuilder: (context, index) {
            final offer = hotOffers[index];
            return _buildHotOfferCard(context, offer);
          },
        ),
      ],
    );
  }

  Widget _buildHotOfferCard(
    BuildContext context,
    HotOfferModel offer,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorName.blackColor.withAlpha(100),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  offer.title,
                  style: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  offer.description,
                  style: TextStyles.normalText.copyWith(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Discount Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        ColorName.primaryColor,
                        ColorName.offSecondaryColor,
                      ],
                    ),
                  ),
                  child: Text(
                    offer.discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

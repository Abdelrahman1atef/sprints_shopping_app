import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';
import 'package:sprints_shopping_app/gen/colors.gen.dart';
import 'dart:async';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';

class FeaturedPageViewModel {
  final String image;
  final String title;

  FeaturedPageViewModel(this.image, this.title);
}

class FeaturedProductsWidget extends StatefulWidget {
  const FeaturedProductsWidget({super.key});

  @override
  State<FeaturedProductsWidget> createState() =>
      _FeaturedProductsWidgetState();
}

class _FeaturedProductsWidgetState
    extends State<FeaturedProductsWidget> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  final List<FeaturedPageViewModel> featuredPageViewImage =
      [
        FeaturedPageViewModel(
          Assets.images.pageViewImage1.path,
          "Premium Laptop Collection",
        ),
        FeaturedPageViewModel(
          Assets.images.pageViewImage2.path,
          "Professional Workspace",
        ),
        FeaturedPageViewModel(
          Assets.images.pageViewImage3.path,
          "Ambient Lighting",
        ),
      ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (
      timer,
    ) {
      if (_currentPage < featuredPageViewImage.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).featuredProducts,
          style: TextStyles.normalText.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Auto-scrolling PageView with curved images
        Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: featuredPageViewImage.length,
                  itemBuilder: (context, index) {
                    final FeaturedPageViewModel
                    featuredPageViewImageItem =
                        featuredPageViewImage[index];
                    return _buildCurvedImageCard(
                      featuredPageViewImageItem.image,
                      featuredPageViewImageItem.title,
                    );
                  },
                ),

                // Page indicator dots
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: List.generate(
                      featuredPageViewImage.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? ColorName.secondaryColor
                              : Colors.white.withOpacity(
                                  0.5,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurvedImageCard(
    String imagePath,
    String title,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

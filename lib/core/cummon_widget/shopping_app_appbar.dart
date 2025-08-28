import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';
import 'package:sprints_shopping_app/utils/device_size.dart';
import 'package:sprints_shopping_app/sprints_shopping_app.dart';

import '../../gen/colors.gen.dart';

class ShoppingAppAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShoppingAppAppbar({
    super.key,
    this.backIsActive = true,
    this.text = "ShopCraft",
  });

  final String text;
  final bool? backIsActive;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final inheritedLocale = InheritedLocale.of(context);
    final currentLocale = Localizations.localeOf(context);
    
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: backIsActive == true
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              color: ColorName.whiteColor,
            )
          : null,
      title: Text(text, style: TextStyles.appTitle),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            inheritedLocale?.toggleLocale();
          },
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              currentLocale.languageCode.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorName.secondaryColor,
              ColorName.primaryColor,
            ],
          ),
        ),
      ),
    );
  }
}

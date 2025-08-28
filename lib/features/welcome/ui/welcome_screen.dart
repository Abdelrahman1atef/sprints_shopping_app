import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/routes/routes.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';
import 'package:sprints_shopping_app/gen/colors.gen.dart';
import 'package:sprints_shopping_app/generated/l10n.dart';

import '../../../core/cummon_widget/shopping_app_appbar.dart';
import '../../../gen/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingAppAppbar(backIsActive: false),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorName.secondaryColor,
              ColorName.primaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).welcomeTagline,
              style: TextStyles.primeText.copyWith(
                fontSize: 28,
                color: ColorName.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset(
                    Assets.images.image1.path,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.network(
                    fit: BoxFit.cover,
                    "https://miro.medium.com/v2/resize:fit:720/format:webp/0*7VyEZgzwUhQMeBqb",
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                signupInButton(
                  text: S.of(context).signUp,
                  fun: () => Navigator.pushNamed(
                    context,
                    Routes.signUp,
                  ),
                ),
                signupInButton(
                  text: S.of(context).signIn,
                  fun: () => Navigator.pushNamed(
                    context,
                    Routes.signIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton signupInButton({
    required String text,
    Function()? fun,
  }) {
    return TextButton(
      onPressed: fun,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          ColorName.whiteColor,
        ),
        elevation: WidgetStatePropertyAll(20),
      ),
      child: Text(
        text,
        style: TextStyles.primeText,
        textAlign: TextAlign.center,
      ),
    );
  }
}

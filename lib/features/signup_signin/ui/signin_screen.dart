import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/cummon_widget/shopping_app_appbar.dart';
import 'package:sprints_shopping_app/core/routes/routes.dart';
import 'package:sprints_shopping_app/generated/l10n.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationEmailRequired;
    }
    if (!value.contains('@')) {
      return S.of(context).validationEmailAt;
    }
    if (!RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value)) {
      return S.of(context).validationEmailValid;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationPasswordRequired;
    }
    if (value.length < 6) {
      return S.of(context).validationPasswordMin;
    }
    return null;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).success),
          content: Text(
            S.of(context).accountSignInSuccessfully,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(
                  context,
                ).pushReplacementNamed(Routes.homeScreen);
              },
              child: Text(S.of(context).close),
            ),
          ],
        );
      },
    );
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      _showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingAppAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                S.of(context).welcomeBack,
                style: TextStyles.primeText.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).signInSubtitle,
                style: TextStyles.primeText.copyWith(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: S.of(context).email,
                  labelStyle: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: S.of(context).emailHint,
                  hintStyle: TextStyles.normalText,
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
                ),
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                  labelStyle: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  hintText: S.of(context).passwordHint,
                  hintStyle: TextStyles.normalText,

                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword =
                            !_obscurePassword;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: _validatePassword,
                obscureText: _obscurePassword,
              ),
              const SizedBox(height: 10),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).forgotPassword,
                    style: TextStyles.primeText.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign In Button
              ElevatedButton(
                onPressed: _handleSignIn,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  S.of(context).signIn,
                  style: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).dontHaveAccount,
                    textAlign: TextAlign.center,
                    style: TextStyles.normalText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.signUp);
                    },
                    child: Text(
                      S.of(context).signUp,
                      style: TextStyles.primeText.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

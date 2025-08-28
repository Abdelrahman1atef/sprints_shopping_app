import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/cummon_widget/shopping_app_appbar.dart';
import 'package:sprints_shopping_app/core/routes/routes.dart';
import 'package:sprints_shopping_app/generated/l10n.dart';
import 'package:sprints_shopping_app/core/theme/text_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).validationFullNameRequired;
    }
    if (value.length < 2) {
      return S.of(context).validationFullNameMin;
    }
    if (value[0] != value[0].toUpperCase()) {
      return S.of(context).validationFullNameUppercase;
    }
    return null;
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return S
          .of(context)
          .validationConfirmPasswordRequired;
    }
    if (value != _passwordController.text) {
      return S.of(context).validationPasswordsNotMatch;
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
            S.of(context).accountCreatedSuccessfully,
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

  void _handleSignUp() {
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
                S.of(context).createAccount,
                style: TextStyles.primeText.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Full Name Field
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: S.of(context).fullName,
                  labelStyle: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: S.of(context).fullNameHint,
                  hintStyle: TextStyles.normalText,
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
                ),
                validator: _validateFullName,
                textCapitalization:
                    TextCapitalization.words,
              ),
              const SizedBox(height: 20),

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
              const SizedBox(height: 20),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: S.of(context).confirmPassword,
                  labelStyle: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: S
                      .of(context)
                      .confirmPasswordHint,
                  hintStyle: TextStyles.normalText,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword =
                            !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: _validateConfirmPassword,
                obscureText: _obscureConfirmPassword,
              ),
              const SizedBox(height: 40),

              // Sign Up Button
              ElevatedButton(
                onPressed: _handleSignUp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  S.of(context).signUp,
                  style: TextStyles.primeText.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).alreadyHaveAccount,
                    textAlign: TextAlign.center,
                    style: TextStyles.normalText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.signIn);
                    },
                    child: Text(
                      S.of(context).signIn,
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

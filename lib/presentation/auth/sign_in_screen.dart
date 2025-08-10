import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/ui_kit/layouts/overlap_auth_scaffold.dart';
import '../../core/ui_kit/buttons/primary_button.dart';
import '../../core/ui_kit/inputs/custom_text_field.dart';
import '../../core/utils/error_message.dart';
import '../../core/utils/auth_navigation_helper.dart';
import '../../domain/entities/user.dart';
import 'auth_providers.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() == true) {
      ref.read(signInControllerProvider.notifier).signIn(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen<AsyncValue<AppUser?>>(signInControllerProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            AuthNavigationHelper.navigateToHome(context);
          }
        },
        error: (error, _) {
          final message = getFriendlyErrorMessage(error);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: colorScheme.primary,
            ),
          );
        },
        loading: () {},
      );
    });

    return OverlapAuthScaffold(
      title: 'Welcome back',
      subtitle: 'Sign in to continue',
      logoAsset: 'assets/images/logos/logo-white.png',
      child: _SignInForm(
        formKey: _formKey,
        email: _emailController,
        password: _passwordController,
        onSubmit: _handleSubmit,
      ),
    );
  }
}

class _SignInForm extends ConsumerWidget {
  const _SignInForm({
    required this.formKey,
    required this.email,
    required this.password,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(signInControllerProvider);
    final isLoading = state.isLoading;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),

          // Email field
          CustomTextField(
            controller: email,
            label: 'Email Address',
            hint: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Password field
          CustomTextField(
            controller: password,
            label: 'Password',
            hint: 'Enter your password',
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.password],
            onFieldSubmitted: (_) => onSubmit(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          // Sign in button
          PrimaryButton(
            label: isLoading ? 'Signing in...' : 'Sign In',
            onPressed: isLoading ? null : onSubmit,
          ),

          const SizedBox(height: 16),

          // Footer - Link to Register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () => AuthNavigationHelper.navigateToRegister(context),
                child: Text(
                  'Create account',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

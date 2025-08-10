import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/ui_kit/layouts/overlap_auth_scaffold.dart';
import '../../core/ui_kit/buttons/primary_button.dart';
import '../../core/ui_kit/inputs/custom_text_field.dart';
import '../../core/utils/error_message.dart';
import '../../core/utils/auth_navigation_helper.dart';
import '../../domain/entities/user.dart';
import 'auth_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() == true) {
      ref.read(registerControllerProvider.notifier).register(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
      );
    }
  }

  Future<bool> _handleBackPress() async {
    AuthNavigationHelper.navigateToSignIn(context);
    return false; // Prevent default back behavior
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen<AsyncValue<AppUser?>>(registerControllerProvider, (previous, next) {
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

    return AuthBackHandler(
      onWillPop: _handleBackPress,
      child: OverlapAuthScaffold(
        title: 'Let\'s get you started',
        logoAsset: 'assets/images/logos/logo-white.png',
        child: _RegisterForm(
          formKey: _formKey,
          name: _nameController,
          email: _emailController,
          password: _passwordController,
          confirm: _confirmController,
          onSubmit: _handleSubmit,
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm({
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
    required this.confirm,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirm;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(registerControllerProvider);
    final isLoading = state.isLoading;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),

          // Name field
          CustomTextField(
            controller: name,
            label: 'Full Name',
            hint: 'Enter your full name',
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your full name';
              }
              if (value.trim().length < 2) {
                return 'Name must be at least 2 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

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
                return 'Please enter your email address';
              }
              if (!RegExp(r'^[\w.-]+@[\w.-]+\.\w+$').hasMatch(value.trim())) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Password field
          CustomTextField(
            controller: password,
            label: 'Password',
            hint: 'At least 8 characters',
            obscureText: true,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                return 'Password must be at least 8 characters with letters and numbers';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Confirm Password field
          CustomTextField(
            controller: confirm,
            label: 'Confirm Password',
            hint: 'Re-enter your password',
            obscureText: true,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => onSubmit(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != password.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          // Register button
          PrimaryButton(
            label: isLoading ? 'Creating...' : 'Create account',
            onPressed: isLoading ? null : onSubmit,
          ),

          const SizedBox(height: 16),

          // Footer - Link to Sign In
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () => AuthNavigationHelper.navigateToSignIn(context),
                child: Text(
                  'Sign in',
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

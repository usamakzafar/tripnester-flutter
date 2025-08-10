# UI Kit

This folder contains reusable UI components for the TripNester app following clean architecture principles.

## Folder Structure

- `inputs/` - Custom input field components
- `buttons/` - Button components with consistent styling
- `text/` - Text widgets and typography components
- `cards/` - Card layout components

## Design Principles

- All components use `Theme.of(context)` for consistent theming
- No hardcoded colors or styles - everything uses the app's color scheme
- Components are stateless and presentation-only (no business logic)
- Follows Material Design 3 guidelines

## Usage Examples

### CustomTextField
```dart
CustomTextField(
  controller: emailController,
  label: 'Email Address',
  hint: 'name@example.com',
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  validator: (value) => value?.isEmpty == true ? 'Required' : null,
)
```

### PrimaryButton
```dart
PrimaryButton(
  label: 'Sign In',
  onPressed: () => handleSignIn(),
)
```

## Theme Integration

All components automatically adapt to:
- App color scheme (green primary, bone white surface)
- Typography scale (Roboto font family)
- Input decoration theme
- Button styling theme

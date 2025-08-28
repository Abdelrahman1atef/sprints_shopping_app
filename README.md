# 🛍️ ShopCraft - Flutter Shopping App

A modern, feature-rich Flutter shopping application with multilingual support, beautiful UI, and seamless user experience.

![Flutter](https://img.shields.io/badge/Flutter-3.9.0-blue?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0.0-blue?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 📱 Project Overview

ShopCraft is a comprehensive e-commerce Flutter application designed to provide users with an intuitive and engaging shopping experience. Built with modern Flutter practices, the app features a clean architecture, responsive design, and robust state management.

### 🎯 Key Highlights
- **Multilingual Support** - English and Arabic localization
- **Modern UI/UX** - Beautiful gradient designs and smooth animations
- **State Management** - Provider pattern for efficient state handling
- **Responsive Design** - Works seamlessly across different screen sizes
- **Clean Architecture** - Well-organized code structure following Flutter best practices

## ✨ Features

### 🔐 Authentication System
- **Sign Up** - User registration with form validation
  - Full name validation (first letter uppercase)
  - Email validation with @ symbol requirement
  - Password validation (minimum 6 characters)
  - Confirm password matching
  - Success dialog with navigation
- **Sign In** - User login with validation
  - Email and password validation
  - Success feedback
  - Forgot password option (placeholder)

### 🏠 Home Screen
- **Welcome Section** - Attractive landing page with gradient background
- **Featured Products** - Auto-scrolling carousel with curved images
  - Page indicators
  - Smooth transitions
  - Product descriptions
- **Shop Our Collection** - Product grid with add-to-cart functionality
  - 2-column responsive layout
  - Product cards with images, titles, and prices
  - Add to cart with SnackBar feedback
- **Hot Offers** - Promotional offers section
  - 5 different offers with color-coded badges
  - Vertically scrollable list
  - Discount information display

### 🌍 Localization
- **Bilingual Support** - English and Arabic
- **Dynamic Language Switching** - Toggle between languages
- **Persistent Language Preference** - Remembers user's choice
- **RTL Support** - Right-to-left layout for Arabic

### 🎨 UI/UX Features
- **Custom App Bar** - Gradient background with language toggle
- **Curved Images** - Modern design with rounded corners
- **Theme Integration** - Consistent color scheme and typography
- **Smooth Animations** - Page transitions and micro-interactions
- **Responsive Layout** - Adapts to different screen sizes

## 🛠️ Technical Stack

- **Framework**: Flutter 3.9.0
- **Language**: Dart 3.0.0
- **State Management**: Provider
- **Localization**: Flutter Intl
- **Storage**: SharedPreferences (with fallback)
- **Code Generation**: Build Runner
- **Asset Management**: Flutter Gen

## 📋 Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK** (3.9.0 or higher)
- **Dart SDK** (3.0.0 or higher)
- **Android Studio** / **VS Code**
- **Git**

## 🚀 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Abdelrahman1atef/sprints_shopping_app.git
cd sprints_shopping_app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Localization Files
```bash
flutter gen-l10n
```

### 4. Generate Asset Files
```bash
flutter packages pub run build_runner build
```

### 5. Run the Application
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── cummon_widget/          # Shared widgets
│   ├── providers/              # State management
│   ├── routes/                 # Navigation and routing
│   └── theme/                  # App theming
├── features/
│   ├── home/                   # Home screen features
│   ├── signup_signin/          # Authentication
│   └── welcome/                # Welcome screen
├── gen/                        # Generated assets
├── generated/                  # Generated localization
├── l10n/                       # Localization files
└── utils/                      # Utility functions
```

## 🎮 Usage

### Language Switching
- Tap the language button (EN/AR) in the app bar
- The app will remember your preference
- All text will update immediately

### Navigation
- **Welcome Screen** → Sign Up / Sign In
- **Authentication** → Home Screen
- **Home Screen** → Browse products and offers

### Product Interaction
- **Featured Products** - Auto-scrolling carousel
- **Shop Collection** - Tap add-to-cart button
- **Hot Offers** - Scroll through promotional offers

## 🔧 Configuration

### Adding New Languages
1. Add new ARB files in `lib/l10n/`
2. Update `pubspec.yaml` localization settings
3. Run `flutter gen-l10n`

### Customizing Theme
- Modify `lib/core/theme/text_styles.dart`
- Update color schemes in `assets/colors/colors.xml`
- Run `flutter packages pub run build_runner build`

## 📱 Screenshots

### 🏠 Welcome & Authentication
<div align="center">
  <img width="300" alt="Welcome Screen" src="https://github.com/user-attachments/assets/93ef0b9e-002a-45ad-bdbc-aa27b394b12a" />
  <img width="300" alt="Sign Up Screen" src="https://github.com/user-attachments/assets/95f6d970-ba6d-441a-8190-2ee2a43486a6" />
  <img width="300" alt="Sign In Screen" src="https://github.com/user-attachments/assets/d45978c1-88ed-4003-9c65-1eb9a987f5ac" />
</div>

### 🛍️ Home Screen & Features
<div align="center">
  <img width="300" alt="Home Screen - Featured Products" src="https://github.com/user-attachments/assets/38a6b850-ecc3-48cb-a9a5-9f3b4645def2" />
  <img width="300" alt="Shop Collection Grid" src="https://github.com/user-attachments/assets/d5604ebb-f70b-43cb-96d2-b0cb151c57af" />
  <img width="300" alt="Hot Offers Section" src="https://github.com/user-attachments/assets/fc452844-f2bd-461f-ad0c-d3641082ff6d" />
</div>

### 📱 App Features Overview
| Feature | Description |
|---------|-------------|
| **Welcome Screen** | Beautiful gradient background with sign up/sign in options |
| **Authentication** | Form validation with real-time feedback |
| **Featured Products** | Auto-scrolling carousel with page indicators |
| **Shop Collection** | Responsive 2-column product grid |
| **Hot Offers** | Promotional offers with color-coded badges |
| **Language Toggle** | Dynamic EN/AR switching with persistence |

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Provider package for state management
- Flutter Intl for localization support
- All contributors and supporters

## 📞 Contact

- **GitHub Profile**: [https://github.com/Abdelrahman1atef](https://github.com/Abdelrahman1atef)
- **Email**: andelrahman atef3221@gmail.com
- **LinkedIn**: [Abdelrahman Atef](https://www.linkedin.com/in/abdelrahman-atef/)

---

⭐ **Star this repository if you found it helpful!**

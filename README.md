# Wealth Manager App

[![Flutter CI](https://github.com/YOUR_USERNAME/wealth_manager_app/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/wealth_manager_app/actions/workflows/flutter_ci.yml)
[![codecov](https://codecov.io/github/sri-akshat/wealth_manager_app/graph/badge.svg?token=8J62GSL6FD)](https://codecov.io/github/sri-akshat/wealth_manager_app)

A comprehensive wealth management application built with Flutter that allows users to track investments, manage transactions, and analyze their financial portfolio.

## Features

- User authentication
- Dashboard with portfolio summary
- Investment tracking
- Transaction management
- Profile settings

## Architecture

This app follows Clean Architecture principles with:

- Domain layer for business entities and repository interfaces
- Data layer for repository implementations
- Presentation layer with controllers and UI components

## Testing

Tests are included for:
- Domain entities
- Repository implementations
- Controllers
- UI components

Run tests with:
```bash
flutter test
```

## Setup Instructions

1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Generate necessary files: `flutter pub run build_runner build --delete-conflicting-outputs`
4. Run the app: `flutter run`

## Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;">
    <img src="assets/screenshots/screenshot1.png" width="250" alt="Loading Screen">
    <img src="assets/screenshots/screenshot2.png" width="250" alt="Loading Screen">
    <img src="assets/screenshots/screenshot3.png" width="250" alt="Login Screen">
    <img src="assets/screenshots/screenshot4.png" width="250" alt="Login Screen">
    <img src="assets/screenshots/screenshot5.png" width="250" alt="Login Screen">
    <img src="assets/screenshots/screenshot6.png" width="250" alt="Dashboard">
    <img src="assets/screenshots/screenshot7.png" width="250" alt="Investments">
    <!-- Add more screenshots as needed -->
</div>

## License

[MIT License](LICENSE)

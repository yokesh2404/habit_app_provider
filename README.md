# habit_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# habit_app_provider

Habit Tracker built with Flutter using Clean Architecture (data/domain/presentation layers), Provider for scoped state management, and Firebase (Auth + Firestore) for real-time sync. Features daily habit logging, streak tracking, a horizontal date-strip selector, and light/dark theme support with local persistence

# Habit Tracker

A cross-platform habit-tracking app built with Flutter, following Clean
Architecture principles for scalability and testability.

## Features

- Create, edit, and delete daily habits
- Track streaks and completion history
- Horizontal date-strip navigation to log habits per day
- Real-time sync across devices via Firebase Firestore
- Secure authentication via Firebase Auth
- Light/dark theme support (system, light, dark)

## Architecture

This project follows Clean Architecture, separated into three layers:

- **Presentation** — UI widgets, Provider-based state (ChangeNotifier),
  screen-level controllers
- **Domain** — Use cases, entities, and repository interfaces
  (framework-independent business logic)
- **Data** — Repository implementations, Firebase data sources,
  local caching, and DTO/model mapping

This separation keeps business logic independent of Flutter and Firebase,
making the app easier to test and maintain as it grows.

## Tech Stack

- **Flutter / Dart**
- **State Management:** Provider (ChangeNotifier, Consumer, Selector)
- **Backend:** Firebase Auth, Cloud Firestore
- **Navigation:** GoRouter
- **Other:** intl (date formatting), shared_preferences (theme persistence)

# Quiz App

A Flutter-based quiz application built with category-based quizzes, timed questions, and score persistence.

## Overview

`quiz_app` is a mobile-first Flutter project that provides: 
- a splash screen onboarding experience
- quiz category selection
- timed quiz questions with answer selection
- performance summary, scoring, and accuracy calculation
- local quiz history stored using `shared_preferences`

## Features

- Category filtering and search for quizzes
- Timed question flow with progress indicators
- Score calculation and performance feedback
- Stored quiz history and completed quiz tracking
- Material-style UI with custom theme utilities

## App Structure

- `lib/main.dart` - app entry point and root `MaterialApp`
- `lib/controller/` - data and state controllers
  - `data_controller.dart` - quiz data and categories
  - `state_controller.dart` - shared navigation state
- `lib/model/` - quiz and category models
- `lib/view/` - UI layout and screen definitions
  - `main_screen.dart` - primary app navigation
  - `appbar.dart` - custom app bar
  - `components.dart` - reusable UI components
  - `theme_utils.dart` - color and text styles
  - `pages/` - feature screens

## Screens

- `SplashScreen` - welcome screen and start button
- `MainScreen` - bottom navigation between Home, Quizzes, and Profile
- `HomeScreen` - quiz stats, categories, and history
- `QuizListScreen` - quiz selection and category filter
- `QuizScreen` - timed quiz experience
- `PerformanceScreen` - results and score summary
- `ProfileScreen` - placeholder "Under Maintenance" view

## Dependencies

- `flutter` 
- `shared_preferences` - local persistence
- `intl` - date formatting
- `circular_progress_stack` - circular progress indicators
- `linear_progress_bar` - linear progress bars
- `shimmer` - loading placeholders

## Assets

- `assets/bg_splash.png`
- `assets/logo_q.png`
- `assets/space.png`
- `assets/icons/` (quiz icons and UI graphics)

## Getting Started

```bash
flutter pub get
flutter run
```

## Notes

- Quiz data is seeded in `lib/controller/data_controller.dart`
- Completed quiz results are saved in `SharedPreferences` under `quizListString`
- The profile tab is currently a placeholder screen

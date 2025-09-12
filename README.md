# Kisan Salahkaar - Flutter App

This is a Flutter mobile application for the "Kisan Salahkaar" platform. It is designed to provide farmers with AI-powered assistance for crop recommendations, pest/disease identification, and real-time market and weather information.

## Project Overview

This app is the mobile counterpart to the existing "Kisan Salahkaar" web application. It connects to the same Firebase backend to ensure a seamless user experience and data consistency across both platforms.

## Core Features

*   **Localized Crop Recommendations**: Get personalized crop suggestions based on your location, soil type, and weather.
*   **Pest & Disease Identification**: Upload a photo of an affected plant to get an AI-powered diagnosis and treatment advice.
*   **Real-time Data Widgets**: Stay updated with weather alerts and local market prices.
*   **Multilingual & Voice-Enabled**: The app supports multiple Indian languages and includes voice-to-text and text-to-speech for an accessible experience.

## Getting Started

### 1. Prerequisites

*   Flutter SDK installed.
*   An editor like VS Code or Android Studio with the Flutter plugin.
*   A configured Firebase project.

### 2. Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-repo/kisan-salahkaar-flutter.git
    cd kisan-salahkaar-flutter
    ```

2.  **Configure Firebase:**
    *   This project requires a `firebase_options.dart` file to connect to your Firebase project.
    *   Use the FlutterFire CLI to generate this file:
        ```bash
        flutterfire configure
        ```
    *   This will guide you through the process of selecting your Firebase project and generating the necessary configuration for Android, iOS, and web. Ensure the generated `lib/firebase_options.dart` file is present.

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

### 3. Running the App

```bash
flutter run
```

This will launch the app on your connected device or emulator.

## Architecture

*   **Framework**: Flutter
*   **State Management**: `provider`
*   **Navigation**: `go_router`
*   **Backend**: Firebase (Authentication, Cloud Functions)
*   **UI**: Material 3

The project follows a feature-first architectural pattern, with code organized into `features`, `core`, `domain`, and `presentation` layers to ensure scalability and maintainability.

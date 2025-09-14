# AgriTech App Blueprint

## Overview
The AgriTech App, named "Kisan Salahkaar," is an AI-powered companion designed to assist farmers with smart farming practices. It provides features such as crop recommendations, government scheme information, and pest and disease identification. The app aims to deliver a modern, intuitive, and accessible user experience with a strong focus on Material Design 3 principles and responsive design.

## Project Outline

### Style and Design
*   **Theming**: Comprehensive Material Design 3 theming with light and dark mode support, managed by `ThemeProvider` (using `provider`).
    *   **Color Scheme**: Utilizes `ColorScheme.fromSeed` with `primaryColor` (vibrant green) and `secondaryColor` (complementary orange).
    *   **Typography**: Employs `google_fonts` (Lato and Oswald) for a consistent and expressive `TextTheme`.
    *   **Component Theming**: Custom styles for `AppBar`, `ElevatedButton`, and `Card` for a cohesive look.
    *   **Dynamic Colors**: Text colors in `TextTheme` and `AppBarTheme` dynamically adapt to the selected theme (light/dark) using `ColorScheme` properties to ensure visual balance.
*   **Aesthetics**: Modern components, visually balanced layout, clean spacing, and polished styles.
    *   **Fonts**: Expressive and relevant typography with varied font sizes for emphasis.
    *   **Color**: Wide range of color concentrations and hues for a vibrant and energetic feel.
    *   **Visual Effects**: Multi-layered drop shadows for depth, "lifted" cards with soft, deep shadows.
    *   **Iconography**: Integration of icons for enhanced understanding and navigation.
    *   **Interactivity**: Buttons, checkboxes, sliders, etc., feature glow effects with elegant color use.
*   **Responsiveness**: Mobile-responsive design adapting to different screen sizes for optimal experience on mobile and web.
*   **Images and Assets**: Placeholder images are used when real images are not available. A previous background image was removed to resolve a rendering crash.
*   **Iconography**: Material Design icons are used throughout the application.

### Features
*   **Crop Recommendations**: Provides AI-driven crop suggestions.
*   **Government Schemes**: Information on relevant government agricultural schemes.
*   **Pest & Disease Identification**: Assists in identifying pests and diseases affecting crops.
*   **Theme Toggle**: User-facing toggle for switching between light, dark, and system themes.

### Architecture
*   **State Management**: `provider` is used for app-wide state management (e.g., `ThemeProvider`). `ValueNotifier` and `ValueListenableBuilder` are used for local state management when appropriate.
*   **Routing**: `go_router` is implemented for declarative navigation, deep linking, and web support, defining routes for the home screen, crop recommendations, government schemes, and pest & disease identification.
*   **Data Flow**: Unidirectional data flow from data sources through services/repositories to state management and then to the UI.
*   **Separation of Concerns**: Project is structured with distinct layers: presentation, domain, and data, organized by feature.

### Accessibility (A11Y) Standards
*   Designed to be accessible to a wide variety of users with different physical and mental abilities, age groups, education levels, and learning styles. (Specific implementations will be detailed as features are developed).

## Resolved Application Crash and Build Failures

### Summary of Fixes
The application was consistently crashing on startup due to an `ImageCodecException` and was subsequently failing to build due to a `No space left on device` error. Both issues have been resolved.

### Steps Taken
1.  **Diagnosed Image Crash**: Identified that the application was crashing during startup while trying to decode an image. The error pointed to `background.jpg`.
2.  **Removed Problematic Image**:
    *   The `background.jpg` file, which was causing the decoding error, was temporarily disabled by renaming it to `background_old.jpg`.
    *   The code in `lib/presentation/home_screen.dart` was modified to remove the `BoxDecoration` that referenced this image.
    *   Text colors on the home screen were adjusted to ensure they were visible against the new, plain background.
3.  **Resolved Disk Space Error**:
    *   The build process was failing with a "No space left on device" error.
    *   Executed `df -h` to confirm that the `/ephemeral` and `/home` partitions were full.
    *   Ran `flutter clean` to remove build artifacts.
    *   Manually deleted the Gradle cache directory (`/home/user/.gradle`) to free up critical disk space.
4.  **Confirmation**: After applying the fixes, the application was successfully built and run on the emulator, confirming that both the startup crash and the build errors are resolved. The app is now in a stable state.

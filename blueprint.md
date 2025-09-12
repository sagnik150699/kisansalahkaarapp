# Kisan Salahkaar - Flutter App Blueprint

## 1. Project Overview

This document outlines the plan for creating a production-ready Flutter mobile application for "Kisan Salahkaar," mirroring the existing Next.js web app. The app will connect to the same Firebase backend to ensure data and service consistency.

## 2. Style, Design, and Features

### UI/UX Style Guidelines

*   **Primary Color**: `#70A96A` (Earthy Green)
*   **Background Color**: `#F5F5DC` (Light Beige)
*   **Accent Color**: `#D4AF37` (Warm Gold)
*   **Font**: 'PT Sans'
*   **Icons**: `lucide_flutter` pack
*   **Layout**: A responsive, card-based design using Material 3 components.

### Core Features

1.  **Localized Crop Recommendations**: A form-based feature to get AI crop advice with a follow-up chat.
2.  **Pest and Disease Identification**: An image-upload feature for AI-powered pest/disease diagnosis, including remedies and a follow-up chat.
3.  **Real-time Data Widgets**: Home screen cards for Weather Alerts and Market Price Tracking.
4.  **Multilingual Support**: Full UI internationalization (i18n) for multiple Indian languages.
5.  **Voice Interface**: Voice-to-text for inputs and text-to-speech for AI responses.
6.  **Government Scheme Information**: A feature to provide information about relevant government schemes for farmers.

## 3. Current Implementation Plan

### Phase 1: Project Foundation & Theming (Completed)

1.  **Update `README.md`**: Replaced boilerplate with a project-specific description.
2.  **Establish Project Structure**: Created directories for `core`, `domain`, `data`, `presentation`, and `features`.
3.  **Add Dependencies**: Added `firebase_core`, `firebase_auth`, `cloud_functions`, `provider`, `go_router`, `google_fonts`, and `lucide_flutter`.
4.  **Implement Base Theme**: Created and applied a `ThemeData` with the specified color scheme and font.
5.  **Setup Initial Routing**: Configured `go_router` with initial routes.
6.  **Initialize Firebase**: Configured `firebase_core` in `lib/main.dart`.
7.  **Create a Basic Home Screen**: Built a simple home page.

### Phase 2: Localized Crop Recommendations (Completed)

1.  **Create UI Form**: Completed.
2.  **Integrate into Navigation**: Completed.
3.  **Implement Location Services**: Completed.
4.  **Implement Backend API Call**: Completed.
5.  **Display Recommendations**: Completed.

### Phase 3: UI/UX Enhancements (Completed)

1.  **Home Screen UI Improvements**:
    *   Added a background image to the home screen.
    *   Styled the buttons and cards to match the app's theme.
    *   Added a title and subtitle to the home screen.

### Phase 4: Government Scheme Information (Completed)

1.  **Create UI Screen**: Completed.
2.  **Integrate into Navigation**: Completed.
3.  **Implement Backend API Call**: Completed.
4.  **Display Schemes**: Completed.

### Phase 5: Pest and Disease Identification (In Progress)

1.  **Create UI Screen**:
    *   **Status**: Completed.
    *   **Details**: A new screen `lib/features/pest_and_disease/presentation/pest_and_disease_screen.dart` has been created.
2.  **Integrate into Navigation**:
    *   **Status**: Completed.
    *   **Details**: The `pest_and_disease_screen` has been added to the `go_router` configuration. A button on the home screen now navigates to this new feature.
3.  **Implement Image Picker**:
    *   **Status**: Completed.
    *   **Details**: The `image_picker` package has been added, and the UI allows users to pick an image from the camera or gallery.
4.  **Implement Backend API Call**:
    *   **Status**: **Up Next**.
    *   **Details**: Fetch pest and disease information from a Firebase backend.
5.  **Display Identification Results**:
    *   **Status**: Completed.
    *   **Details**: The UI displays the identified pest or disease, along with its description and remedy.

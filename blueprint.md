# Kisan Salahkaar - App Blueprint

## Overview

Kisan Salahkaar is a comprehensive mobile and web application designed to empower farmers with timely and relevant agricultural information. The app acts as a digital advisor, providing crucial data and AI-powered recommendations to help farmers make informed decisions, improve crop yield, and increase profitability.

## Style and Design

*   **Theme**: The app will use a Material 3 design system with a green and earthy color palette, reflecting the agricultural theme.
*   **Typography**: We will use the `google_fonts` package to implement clean and readable fonts like 'Roboto' and 'Lato'.
*   **Iconography**: The app will use modern and intuitive icons from the `lucide_flutter` package to enhance usability.
*   **Layout**: The layout will be clean, card-based, and easy to navigate, ensuring a user-friendly experience even for non-tech-savvy users.

## Features

### Implemented Features

*   **Home Dashboard**: A central screen providing access to all major features of the application.
*   **AI-Powered Crop Recommendations**: Suggests the top 3 crops to plant based on the user's location, soil type, and local weather patterns. Includes a conversational follow-up chat.
*   **Instant Pest & Disease Identification**: Users can upload a photo of a distressed plant for AI-powered diagnosis. Provides detailed organic and inorganic remedies and suggests commercially available products. Includes a follow-up chat.
*   **Real-Time Localized Data**:
    *   **Weather Reports**: Provides a current weather summary and a 24-hour forecast.
    *   **Market Prices**: Displays current market prices for common crops in nearby markets.
*   **Government Schemes**: Lists and details relevant government schemes for farmers.
*   **Enhanced Accessibility & Ease of Use**:
    *   **Multilingual Support**: The interface and all AI responses will be available in multiple Indian languages.
    *   **Geolocation**: Automatically detects the user's location.
    *   **Voice-to-Text**: Allows users to dictate follow-up questions.
    *   **Text-to-Speech**: AI-generated text responses can be read aloud.

## Gemini Model Integration

*   **`gemini-1.5-pro` / `gemini-1.5-flash`**:
    *   `generateCropRecommendationsFlow`: Analyzes user's location, soil, and weather data.
    *   `identifyPestOrDiseaseFlow`: Multimodal analysis of plant images and text prompts.
    *   `followUp...Flows`: Context-aware conversational follow-up for all AI features.
*   **`gemini-1.5-flash`**:
    *   `getWeatherReportFlow` & `getMarketPricesFlow`: Fetches and formats real-time data.
    *   `getLocationDetailsFlow`: Determines city/district and weather patterns from coordinates.
    *   `guessSoilTypeFlow`: Guesses soil type based on location.
*   **`gemini-1.5-flash-preview-tts`**:
    *   `textToSpeechFlow`: Converts AI text responses to speech.

## Current Plan

1.  **Update App Identity**: Change the app name to "Kisan Salahkaar" and update the app icons and favicon.
2.  **Establish Core Structure**:
    *   Set up the main application widget, theme, and routing in `main.dart`, `lib/core/router.dart`, and `lib/core/theme.dart`.
3.  **Design the Home Screen**:
    *   Create a visually appealing and functional home screen in `lib/presentation/home_screen.dart` with `FeatureCard` widgets for navigation.
4.  **Implement Feature Screens (UI First)**:
    *   Build the user interface for each feature: Crop Recommendations, Pest & Disease ID, Weather Report, and Market Prices.
5.  **Integrate Gemini Models**:
    *   Set up the Firebase AI SDK.
    *   Implement the backend logic for each feature by calling the appropriate Gemini models.
    *   Add the conversational chat feature.
    *   Integrate text-to-speech and voice-to-text functionalities.
6.  **Refine and Format**:
    *   Run `flutter format .` to ensure consistent code styling.
    *   Address any analysis issues found by `flutter analyze`.

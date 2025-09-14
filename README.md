# Kisan Salahkaar - AI Farming Companion

"Kisan Salahkaar" is an AI-powered mobile application built with Flutter to assist farmers in making informed decisions for their agricultural practices. The app provides crop recommendations, information about government schemes, and tools for identifying pests and diseases.

## Features

*   **Crop Recommendations**: Get intelligent crop suggestions based on your location and soil type.
*   **Government Schemes**: Stay updated with the latest agricultural schemes and subsidies from the government.
*   **Pest & Disease Identification**: Upload images of affected crops to identify pests and diseases and get instant remedies.
*   **Modern UI/UX**: A clean, intuitive, and responsive user interface built with Material Design 3.
*   **Light & Dark Mode**: Seamlessly switch between light and dark themes for comfortable viewing.

## Technology Stack

*   **Frontend**: Flutter
*   **Backend & AI**: Firebase (using `firebase_ai` for generative AI features)
*   **Routing**: `go_router`
*   **State Management**: `provider`
*   **Typography**: `google_fonts`

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/kisan-salahkaar.git
    cd kisan-salahkaar
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure

The project follows a feature-first architecture, with each feature having its own `data`, `domain`, and `presentation` layers.

```
lib
├── core/
│   ├── router.dart
│   └── theme.dart
├── features/
│   ├── crop_recommendations/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── government_schemes/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── pest_and_disease/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── presentation/
│   ├── home_screen.dart
│   ├── providers/
│   └── widgets/
└── main.dart
```

## Visual Design

The app is designed with a modern and visually appealing aesthetic, following Material Design 3 principles. It features a vibrant color palette, expressive typography, and interactive UI components to provide an engaging user experience.

## Accessibility (A11Y)

The app is designed to be accessible to all users, with a focus on clear navigation, readable text, and support for various screen sizes.

## Author

**Sagnik Bhattacharya**
*   **LinkedIn**: [linkedin.com/in/sagnik-bhattacharya-916b9463/](https://linkedin.com/in/sagnik-bhattacharya-916b9463/)
*   **Udemy**: [udemy.com/user/sagnik-bhattacharya-5/](https://www.udemy.com/user/sagnik-bhattacharya-5/)
*   **YouTube**: [youtube.com/@sagnikteaches](https://www.youtube.com/@sagnikteaches)

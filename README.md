# Kisan Salahkaar - AI Farming Companion

"Kisan Salahkaar" is an AI-powered, cross-platform application built with Flutter to assist farmers in making intelligent, data-driven decisions for their agricultural practices. The app serves as a digital advisor, leveraging Google's Gemini models to provide real-time, localized, and actionable insights.

## Features

*   **AI-Powered Crop Recommendations**: Enter your location, soil type, and weather patterns to receive AI-generated suggestions for the top 3 most suitable crops. Engage in a conversational follow-up to ask questions about the recommendations.
*   **Instant Pest & Disease Identification**: Upload a photo of an affected plant, and the AI will diagnose the specific pest or disease. The app provides detailed organic and inorganic remedies, along with suggestions for commercially available products.
*   **Real-Time Market Prices**: Get up-to-date market prices for common crops in your vicinity to help you decide the best time and place to sell your produce.
*   **Localized Weather Reports**: Access a current weather summary and a 24-hour forecast for your specific location to plan your farming activities effectively.
*   **Government Schemes**: Stay informed about the latest agricultural schemes, subsidies, and support programs offered by the government.

## Technology Stack

*   **Frontend**: Flutter
*   **AI & Generative Models**: Google Gemini (via `firebase_ai` package)
    *   `gemini-1.5-pro` for complex multimodal tasks (Pest & Disease ID).
    *   `gemini-1.5-flash` for text generation, data retrieval, and chat.
*   **Backend & Authentication**: Firebase
*   **State Management**: Riverpod

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-name/your-repo
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

## Build for Production

*   **Android (APK):**
    ```bash
    flutter build apk --release
    ```
*   **Web:**
    ```bash
    flutter build web --release
    ```

## Credits

*   **Author:** Your Name ([your-site.example.com](https://your-site.example.com))
*   **Source Code:** [https://github.com/your-name/your-repo](https://github.com/your-name/your-repo)
*   **License:** Apache-2.0

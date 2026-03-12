# 🚀 Flutter AI Chat Interface

A minimal AI chat application built using Flutter and OpenRouter LLM API.

## Features
- Chat UI with message bubbles
- AI responses via OpenRouter
- Conversation history
- Typing indicator
- Auto scroll

## Tech Stack
- Flutter
- Dart
- OpenRouter API
- LLaMA 3.1 model

## Assignment Questions
# 1. Why did you choose this challenge?

I chose this challenge because it combines UI development, asynchronous state handling, and AI integration, which are core skills required for modern AI-powered applications. Building a chat interface is also an interesting problem because it requires handling real-time user interaction, smooth UX, and external API communication.

Additionally, I wanted to explore how large language models can be integrated into a Flutter application, which is increasingly relevant as AI assistants become common in many products.

# 2. What architecture / state management did you use and why?

The application follows a simple modular architecture to keep the code clean and maintainable.

Structure used:

lib
 ├── models      → Data models (Message)
 ├── widgets     → Reusable UI components (MessageBubble)
 ├── screens     → Main UI logic (ChatScreen)
 └── services    → External API communication (OpenRouterService)

For state management, I used Flutter's built-in StatefulWidget since the application has a relatively small state scope:

Message list

Typing indicator

Conversation history

Using StatefulWidget keeps the implementation lightweight and easy to understand, which is suitable for a minimal challenge. If the project grew larger, I would consider Riverpod or Bloc for more scalable state management.

# 3. If this app scaled to 100K users, what would you improve?

If this application needed to scale to 100K+ users, several improvements would be necessary:

Backend Layer

Introduce a secure backend server to proxy OpenRouter API requests instead of exposing API keys in the client.

Implement rate limiting and authentication.

Architecture

Move from local state to structured state management (Riverpod/Bloc).

Add repository pattern for better separation of concerns.

Performance

Implement message pagination and caching.

Use streaming responses for better user experience.

Optimize rendering with ListView virtualization.

Security

Store API keys securely on the backend.

Implement user authentication and session management.

Monitoring

Add logging, analytics, and monitoring (e.g., Sentry, Firebase).

# 4. Why do you want to intern at Avyxon AI Labs?

I am interested in interning at Avyxon AI Labs because the company focuses on building AI-first products, which aligns strongly with my interest in artificial intelligence and real-world AI applications.

I enjoy working at the intersection of software engineering and AI systems, and I believe this internship would provide valuable experience in building production-grade AI tools. I am particularly excited about the opportunity to learn from engineers who are actively developing AI-driven products and to contribute to meaningful projects.

# 5. Additional Notes

This project demonstrates:

Clean UI structure

Modular Flutter architecture

Integration with a real LLM (OpenRouter)

Handling asynchronous API calls

Smooth chat UX with typing indicator and auto-scroll

The goal was to build a minimal yet functional AI chat interface with clear code structure and extensibility.
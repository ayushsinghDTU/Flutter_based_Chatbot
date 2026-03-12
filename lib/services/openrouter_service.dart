import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouterService {

  static const apiKey ="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";

  static Future<String> sendMessage(List<Map<String, String>> messages) async {

    final response = await http.post(
      Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
        "HTTP-Referer": "http://localhost",
        "X-Title": "Flutter AI Chat"
      },
      body: jsonEncode({
        "model": "meta-llama/llama-3.1-8b-instruct",
        "messages": messages
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      return "API Error ${response.statusCode}: ${response.body}";
    }
  }
}


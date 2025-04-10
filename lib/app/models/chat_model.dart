class ChatMessageModel {
  final String? text;
  final String? imageUrl;
  final bool isMe;
  final DateTime timestamp;

  ChatMessageModel({
    this.text,
    this.imageUrl,
    required this.isMe,
    required this.timestamp,
  });
}

enum MessageType { text, image }

final List<ChatMessageModel> messages = [
  ChatMessageModel(
    text: "Hey, how's it going?",
    isMe: true,
    timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  ChatMessageModel(
    text: "I'm doing well! Check out this view.",
    imageUrl:
        "https://images.unsplash.com/photo-1453169753818-2feab4b4246d?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    // Image URL
    isMe: false,
    timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
  ),
  ChatMessageModel(
    text: "Wow, that looks amazing!",
    isMe: true,
    timestamp: DateTime.now().subtract(const Duration(seconds: 50)),
  ),
  ChatMessageModel(
    imageUrl:
        "https://images.unsplash.com/photo-1468352965811-8b57e9a0781f?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    // Another image
    isMe: false,
    timestamp: DateTime.now().subtract(const Duration(seconds: 30)),
  ),
  ChatMessageModel(
    text: "This is an image with text below it.",
    imageUrl:
        "https://plus.unsplash.com/premium_photo-1685207267343-1c8852b45575?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    // Image with text
    isMe: true,
    timestamp: DateTime.now().subtract(const Duration(seconds: 10)),
  ),
  ChatMessageModel(
    text: "Got it! Catch you later.",
    isMe: false,
    timestamp: DateTime.now(),
  ),
];

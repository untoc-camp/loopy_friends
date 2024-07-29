class Post {
  String title;
  String content;
  DateTime timestamp;

  Post({
    required this.title,
    required this.content,
    required this.timestamp,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'] as String) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class Post {
  String title;
  String content;
  DateTime timestamp;
  int likes;

  Post({
    required this.title,
    required this.content,
    required this.timestamp,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'] as String) : DateTime.now(),
      likes: json['likes'],
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

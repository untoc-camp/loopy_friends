class MyWrittenPost {
  int id;
  String title;
  String content;
  DateTime timestamp;

  MyWrittenPost({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  factory MyWrittenPost.fromJson(Map<String, dynamic> json) {
    return MyWrittenPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

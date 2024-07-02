class Notice {
  final String title;
  final String created_at;
  final String content;

  Notice({required this.title, required this.created_at, required this.content});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      created_at: json['created_at'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'created_at': created_at,
      'content': content,
    };
  }
}

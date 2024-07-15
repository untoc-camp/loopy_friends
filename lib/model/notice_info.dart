class Notice_info {
  final String title;
  final String created_at;
  final String content;
  final String urllink;

  Notice_info({required this.title, required this.created_at, required this.content, required this.urllink});

  factory Notice_info.fromJson(Map<String, dynamic> json) {
    return Notice_info(
      title: json['title'] ?? '',
      created_at: json['created_at'] ?? '',
      content: json['content'] ?? '',
      urllink: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'created_at': created_at,
      'content': content,
      'url': urllink,
    };
  }
}

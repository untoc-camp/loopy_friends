class Notice {
  final int id;
  final String title;
  final String created_at;

  Notice({required this.title, required this.created_at, required this.id});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      created_at: json['created_at'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'created_at': created_at,
      'id': id,
    };
  }
}

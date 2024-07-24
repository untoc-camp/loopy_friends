class Notice {
  final int id;
  final String title;
  final String created_at;
  final String deadline;

  Notice({required this.title, required this.created_at, required this.id, required this.deadline});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      created_at: json['created_at'] ?? '',
      id: json['id'] ?? '',
      deadline: json['deadline'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'created_at': created_at,
      'id': id,
      'deadline': deadline,
    };
  }
}
